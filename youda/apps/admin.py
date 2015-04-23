from django.contrib import admin
import models

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
                        'created_at',
                        'updated_at',
                    )
    
    list_filter = ('created_at',)
    search_fields = ('user__user__username',
                     'question_content',
                    'question_detail',) #Foreign key
    
    # Inner function to show signature of a certain user
    def signature(self,obj):
        return obj.author.signature
    
    signature.short_description = 'New Signature'
    
# Register your models here.
admin.site.register(models.Questions, QuestionAdmin)
admin.site.register(models.Answers)
admin.site.register(models.YoudaUser)
admin.site.register(models.Topics)

# admin.site.register(models.AnswersComments)
# admin.site.register(models.Articles)
# admin.site.register(models.Associations)
# admin.site.register(models.InvitationUsers)
# admin.site.register(models.Jobs)
# admin.site.register(models.Logs)
# admin.site.register(models.Messages)
# admin.site.register(models.PrivateLetters)
# # admin.site.register(models.Questions)
# admin.site.register(models.Schools)
# admin.site.register(models.Topics)
# admin.site.register(models.UsersAffiliate)



