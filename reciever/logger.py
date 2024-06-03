import imp
from rest_framework_tracking.mixins import LoggingMixin
from django.db.models import Avg
from reciever.models import Ab, ProvidedApis
from django.conf import settings

from mixpanel import Mixpanel
mp = Mixpanel(settings.PROJECT_TOKEN)

def isUserExist(request):
    try:
        return request.client_user != None
    except:
        return False

def get_details_for_metrics_from_path(request, resultOut):
    try:
        totalRequest = Ab.objects.filter(token=request.client_token)
        failedRequestCount = totalRequest.filter(status_code__range=[400, 500]).count()
        resultOut['failed'] = failedRequestCount
        resultOut['total'] = totalRequest.count()
        resultOut['avg_response_ms'] = round(totalRequest.aggregate(avg=Avg('response_ms'))['avg'], 2)
    except Exception as e:
        pass
import json
class LoggingUserMixin(LoggingMixin):
    
    def handle_log(self):
        try:
            api = ProvidedApis.objects.get(token=self.request.client_token)
            apiVal = ProvidedApis.objects.values().get(token=self.request.client_token)
            self.log['user'] = self.request.client_user
            self.log['username_persistent'] = self.request.client_user_email
            self.log['token'] = self.request.client_token
            self.log['response'] = apiVal
            
            abLast = Ab(**self.log)
            abLast.save()
            
            abQs = Ab.objects.filter(token=self.request.client_token)
            
            
            api.failedRequestsCount = abQs.filter(status_code__range=[400, 500]).count()
            api.totalRequests = abQs.count()
            api.avgResponseMs = round(abQs.aggregate(avg=Avg('response_ms'))['avg'], 2)
            api.save()
            
            event = {
                'status': abLast.status_code,
                'query': abLast.query_params,
                'plan': api.plan.name,
                'api': list(api.api.values_list('name', flat=True)),
                'user_id': abLast.username_persistent,
                'view': abLast.view,
                # 'Company' : name
            }
            # print(mp.group_set_once('Company', name, {'Company Type': 'OEM', '$name': name}))
            print(mp.track(abLast.username_persistent, abLast.path, event))
        except Exception as e:
            import traceback
            traceback.print_exc()
            print("unable to save ",e)
