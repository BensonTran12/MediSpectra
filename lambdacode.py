import boto3
import base64
import json
import io
from PIL import Image

sagemaker_runtime = boto3.client('sagemaker-runtime')

sagemaker_endpoint_name = 'canvas-new-deployment-11-17-2024-12-36-AM' 

def lambda_handler(event, context):
    try:
        print("Received event: ", json.dumps(event))

        base64_image_data = event['queryStringParameters']['image']
        if not base64_image_data:
            raise ValueError("Image data not found in the event.")

        image_data = base64.b64decode(base64_image_data)

        image = Image.open(io.BytesIO(image_data))

        print(f"Image size: {image.size}")

        img_byte_array = io.BytesIO()
        image.convert('RGB').save(img_byte_array, format='JPEG')
        img_byte_array = img_byte_array.getvalue()

        
        response = sagemaker_runtime.invoke_endpoint(
            EndpointName=sagemaker_endpoint_name,
            ContentType='application/x-image',
            Accept='application/json',
            Body=img_byte_array  
        )

        print("SageMaker response: ", response)

        response_body = response['Body'].read().decode()
        print("SageMaker response body: ", response_body) 

        result = json.loads(response_body)

        predicted_label = result.get('predicted_label', 'Unknown')
        confidence_score = result.get('confidence_score', 0.0)

        return {
            'statusCode': 200,
            'body': json.dumps({
                'predicted_label': predicted_label,
                'confidence_score': confidence_score
            })
        }

    except Exception as e:
        print(f"Error: {str(e)}")
        return {
            'statusCode': 500,
            'body': json.dumps({'error': str(e)})
        }
