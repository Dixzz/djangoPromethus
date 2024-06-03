# ---------------------------------------------------------------------------- #
#                                GET IP ADDRESS                                #
# ---------------------------------------------------------------------------- #

def get_client_ip(request):
    # import pdb
    try:
        x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
        if x_forwarded_for:
            ip = x_forwarded_for.split(",")[0]
        else:
            ip = request.META.get('REMOTE_ADDR', None)
        return ip
    except Exception as e:
        pass
# ---------------------------------------------------------------------------- #