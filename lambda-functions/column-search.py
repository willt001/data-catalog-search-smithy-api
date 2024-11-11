import json
import boto3

glue_client = boto3.client('glue')

def lambda_handler(event, context):
    response = glue_client.get_tables(
        DatabaseName='search-api-example-db',       
    )
    table_list = response['TableList']
    search_text = event['queryStringParameters']['searchText']
    search_results = {
        'TableList': []
    }
    for table in table_list:
        columns_found = []
        for column in table['StorageDescriptor']['Columns']:
            if search_text.lower() in column['Name'].lower():
                columns_found.append(column)
        if columns_found:
            search_results['TableList'].append(
                {
                'Name': table['Name'],
                'Description': table['Description'],
                'Columns': columns_found
                }
            )    
    return {
        'statusCode': 200,
        'body': json.dumps(search_results)
    }
