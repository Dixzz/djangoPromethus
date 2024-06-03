import os
import mimetypes

from wsgiref.util import FileWrapper

from django.http import StreamingHttpResponse, FileResponse

import csv

    
def file_response(request, path):
    the_file = path
    filename = os.path.basename(the_file)
    
    print("Path ", filename, path)
    chunk_size = 8192
    response = StreamingHttpResponse(
        FileWrapper(
            open(the_file, "r"),
            chunk_size,
        ),
        content_type="application/octet-stream"

        # content_type=mimetypes.guess_type(the_file)[0],
    )
    # response["Content-Length"] = os.path.getsize(the_file)
    response["Content-Disposition"] = f"attachment; filename={filename}"
    _delete_file(path)
    return response

def _delete_file(path):
   """ Deletes file from filesystem. """
   if os.path.isfile(path):
       os.remove(path)