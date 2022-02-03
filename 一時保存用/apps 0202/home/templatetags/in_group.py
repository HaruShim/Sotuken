from django.template import Library
register = Library()

@register.filter
def in_group(user, team_name):
    print(user.groups.all())
    print(user.username)
    if user.groups.filter(name=team_name).exists():
        return True
    else:
        return False