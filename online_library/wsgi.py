"""
WSGI config for online_library project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/4.0/howto/deployment/wsgi/
"""

import os

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'online_library.settings')
os.environ.setdefault("DJANGO_CONFIGURATION", "Dev")

from configurations.wsgi import get_wsgi_application

application = get_wsgi_application()
