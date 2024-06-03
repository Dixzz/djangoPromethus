from django.db import models
import uuid
from django.contrib.auth.models import \
    BaseUserManager, AbstractBaseUser
from django.contrib.auth.models import Group

## References
"""
import uuid
https://www.geeksforgeeks.org/generating-random-ids-using-uuid-python/

uuid.uuid1().int
261633430786074253504905329547929456930
"""


from datetime import datetime, timedelta

from django.conf import settings
import jwt

class UserManager(BaseUserManager):
    """
    creating a manager for a custom user model
    https://medium.com/analytics-vidhya/django-rest-api-with-json-web-token-jwt-authentication-69536c01ee18
    https://docs.djangoproject.com/en/3.0/topics/auth/customizing/#writing-a-manager-for-a-custom-user-model
    https://docs.djangoproject.com/en/3.0/topics/auth/customizing/#a-full-example
    """

    def create_user(self, email, password=None):
        """
        Create and return a `user` with email, username, and password
        """

        if not email:
            raise ValueError('User must have an email address')

        user = self.model(
            email = self.normalize_email(email)
        )
        user.set_password(password)
        user.save()
        return user
    
    def create_superuser(self, email, password=None):
        """
        Create and return a `User` with superadmin permissions
        """
        if password is None:
            raise TypeError('Superuser must have a password')
        user = self.create_user(email, password)
        user.is_superuser = True
        user.is_staff = True
        user.save()
        return user

class User(AbstractBaseUser):
    """Custom user model"""
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    email = models.EmailField(
        verbose_name='email address',
        max_length=255,
        unique=True)
    # groups = models.ForeignKey(Group, on_delete=models.CASCADE)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)
    USERNAME_FIELD = 'email'

    REQUIRED_FIELDS = []

    objects = UserManager()

    def has_perm(self, perm, obj=None):
        return self.is_superuser

    def has_module_perms(self, app_label):
        return self.is_superuser

    def __str__(self):
        return self.email

    # @property
    # def token(self):
    #     """
    #     Allows us to get a user's token by calling `user.token` instead of
    #     `user.generate_jwt_token().

    #     The `@property` decorator above makes this possible. `token` is called
    #     a "dynamic property".
    #     """
    #     return self._generate_jwt_token()

    def _generate_jwt_token(self):
        """
        Generates a JSON Web Token that stores this user's ID and has an expiry
        date set to 60 days into the future.
        """
        dt = datetime.now() + timedelta(days=60)

        token = jwt.encode({
            'id': self.email,
            'exp': int(dt.strftime('%s'))
        }, settings.SECRET_KEY, algorithm='HS256')
        return token.decode('utf-8')

    # class Meta:
    #     db_table = u'user_user'
    #     managed = False

"""Errors faced in user_parem admin
https://stackoverflow.com/a/47110623/7999665
"""
