
{% set pageTitle = page.title || config.subtitle || '' %}

{% if is_archive() %}
  {% set pageTitle = 'Archives' %}
{% endif %}

{% if is_tag() %}
  {% set pageTitle = 'Tag: ' + page.tag %}
{% endif %}

{% if is_category() %}
  {% set pageTitle = 'Category: ' + page.category %}
{% endif %}

{% if is_month() %}
  {% set pageTitle = pageTitle + ': ' + page.month + '/' + page.year %}
{% endif %}

{% if is_year() %}
  {% set pageTitle = pageTitle + ': ' + page.year %}
{% endif %}

{% set pageTitle = pageTitle + ' [ ' + config.title + ' ]' %}

<!doctype html>
<html lang="{{ config.language }}">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <title>{{ pageTitle }}</title>
  {% if theme.stylesheets !== undefined && theme.stylesheets.length > 0 %}
    {# stylesheet list from config.yml #}
    {% for url in theme.stylesheets %}
      <link rel="stylesheet" href="{{ url }}">
    {% endfor %}
  {% endif %}
</head>
<body>

<div id="menu-outer">
  <div id="menu-inner">
  <ul id="menu" class="menu">
    {% for key in Object.keys(theme.menu) %}
      <li class="menu-item">
      <a href="{{ theme.menu[key] }}">{{ key }}</a>
      </li>
    {% endfor %}
   </ul>
  </div>
  <div id="intro">
    <p class="title">
      <a>{{ config.title }}</a>
    </p>
    <p class="subtitle">
      {{ config.subtitle }}
    </p>
  </div>
</div>

<div id="content-outer">
  <div id="content-inner">
    {# {% autoescape false %}{{ body }}{% endautoescape %} #}
    {% block body %}{% endblock %}
  </div>
</div>

<div id="bottom-outer">
  <div id="bottom-inner">
    Site by {{ config.author }}
    <br>
    <!--<a href="{{ config.root }}">Home</a>-->
  </div>
</div>

{% if theme.scripts !== undefined && theme.scripts.length > 0 %}
  {# scripts list from config.yml #}
  {% for url in theme.scripts %}
    <script src="{{ url }}"></script>
  {% endfor %}
{% endif %}

</body>
</html>
