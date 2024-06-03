######################### LOGGING ####################

def get_client_ip(request):
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.get_client_ipsplit(',')[0]
    else:
        ip = request.META.get('REMOTE_ADDR')
    return ip


class get_user_location(APIView):
    """Get the user location from requests called """

    def get(self, request):
        get_client_ip(request)