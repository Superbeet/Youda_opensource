from django.contrib import admin
from apps import models

class QuestionAdmin(admin.ModelAdmin):
    list_display = (
                        'question_id',
                        'user',
                        'question_content',
                        'question_detail',
                        'topic', 
                        'publish_time',
                        'active_time',
                        'browse_num',
                        'answer_num',
                        'want_answer_num',
                        'attention_num',
                        'invation_num',
                        'has_attach',
#                         'created_at',
#                         'updated_at',
                    )
    
#     list_filter = ('created_at',)
    search_fields = ('title','author__user__username') #Foreign key
    
    # Inner function to show signature of a certain user
    def signature(self,obj):
        return obj.author.signature
    
    signature.short_description = 'New Signature'
    
# Register your models_2 here.
# admin.site.register(models_2.Question, QuestionAdmin)
# admin.site.register(models_2.Answer)
# admin.site.register(models_2.AnswerComment)
# admin.site.register(models_2.Article)
# admin.site.register(models_2.Association)
# admin.site.register(models_2.InvitationUser)
# admin.site.register(models_2.UserJob)
# admin.site.register(models_2.Log)
# admin.site.register(models_2.Message)
# admin.site.register(models_2.PrivateLetter)
# # admin.site.register(models_2.Questions)
# admin.site.register(models_2.School)
# admin.site.register(models_2.Topic)
# admin.site.register(models_2.User)
# admin.site.register(models_2.UserAffiliate)



