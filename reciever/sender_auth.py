import requests
from rest_framework import status

# ---------------------------------------------------------------------------- #
#                          FROM SENDER AUTHENTICATION                          #
# ---------------------------------------------------------------------------- #

url = "https://sender.paplilabs.com/login_api/ManualToken/"

def get_user(token_info, url):
    """Get User"""
    payload = {}
    headers = {
    'Authorization' : token_info
    }
    response = requests.request("POST", url, headers=headers, data = payload)
    return response

def user_detail_response(token):
        # token_info    = request.headers['Authorization']
        token_info    = token 
        result        = get_user(token_info, url)
        status_code   = status.HTTP_200_OK
        json_response = result.json()
        email         = json_response['email']
        user_id       = json_response['user_id']
        user_type     = json_response['user_profile'][0]['user_type']
        middle = {
            'eamil'         : email,
            'user_id'       : user_id,
            'user_type'     : user_type,
        }
        return middle


def get_company_id(token):
    """Get Company id from user"""
    pass

# ---------------------------------------------------------------------------- #
