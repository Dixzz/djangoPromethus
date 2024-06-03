bucket = 'gis_receiving_pothole_image_bucket'
folder 'GIS/Raw/2020-05-27'
file = 'some_file.txt'
gcs_url = 'https://%(bucket)s.storage.googleapis.com/%(file)s' % {'bucket':bucket, 'file':file}
print gcs_url