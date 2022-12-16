from django.db import models
from django.contrib.auth.models import AbstractUser, UserManager
from django.utils.translation import gettext_lazy as _
# Create your models here.

class LibraryUserManager(UserManager):
    def create_user(self, email, password=None, is_admin=False, is_staff=False,
                    is_active=True):
        if not email:
            raise ValueError("User must have an email")
        if not password:
            raise ValueError("User must have a password")
        # if not full_name:
        #     raise ValueError("User must have a full name")

        user = self.model(
            email=self.normalize_email(email)
        )
        # user.full_name = full_name
        user.set_password(password)  # change password to hash
        user.admin = is_admin
        user.staff = is_staff
        user.active = is_active
        user.save(using=self._db)
        return user

    def create_superuser(self, email,password=None, **extra_fields):
        if not email:
            raise ValueError("User must have an email")
        if not password:
            raise ValueError("User must have a password")
        # if not full_name:
        #     raise ValueError("User must have a full name")

        user = self.model(
            email=self.normalize_email(email)
        )
        user.set_password(password)
        # user.profile_picture = profile_picture
        user.admin = True
        user.staff = True
        user.active = True
        user.save(using=self._db)
        return user

exam_choice = (
    ("jee", "JEE"),
    ("cet", "CET"),
    ("jee_adv", "JEE Advanced"),
    ("neet", "NEET"),
    ("others", "Others")
)

social_media_choice = (
    ("instagram", "Instagram"),
    ("facebook", "Facebook"),
    ("linkedin","Linkedin"),
    ("twitter", "twitter"),
    ("none","None"),
)

class User(AbstractUser):
        username = None
        email = models.EmailField(_("email address"),unique=True,)
        first_name = models.CharField(max_length=20)
        last_name = models.CharField(max_length=20)
        exam = models.CharField(choices=exam_choice, default="others", max_length=20)
        social_media = models.CharField(choices=social_media_choice, default="none", max_length=20)
        objects = LibraryUserManager()
        USERNAME_FIELD = "email"
        REQUIRED_FIELDS = []
        
        def __str__(self):
            return self.email
        
        def get(self):
            return (self.email+" "+self.first_name+" "+self.last_name+" "+self.exam+" "+self.social_media)



# class UserRegistrationExtraFields(models.Model):





