from django import template
from django.utils.html import format_html


register = template.Library()

@register.simple_tag(takes_context=True)
def row(context, extra_classes=""):
    return format_html('<div class="row {}">',extra_classes)

@register.simple_tag(takes_context=True)
def endrow(context):
    return format_html("</div>")

@register.simple_tag(takes_context=True)
def col(context, extra_classes=""):
    return format_html('<div class="col {}">', extra_classes)

@register.simple_tag(takes_context=True)
def endcol(context):
    return format_html("</div>")