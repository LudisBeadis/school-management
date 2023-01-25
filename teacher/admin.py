from django.contrib import admin
from .models import *


class TeacherAdmin(admin.ModelAdmin):
    list_display = ("profile",'instagram','telegram')


admin.site.register(Teacher,TeacherAdmin)
admin.site.register(GradePost)
admin.site.register(Subject)