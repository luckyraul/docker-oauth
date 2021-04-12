<!DOCTYPE html>
<html>
  <head>
      <title>Welcome to Mygento</title>
      <meta name="robots" content="noindex, nofollow">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="shortcut icon" href="${resourcesPath}/img/favicon.ico" />
<#if properties.styles?has_content>
    <#list properties.styles?split(' ') as style>
      <link href="${resourcesPath}/${style}" rel="stylesheet" type="text/css"/>
    </#list>
</#if>
  </head>
  <body>
    <div class="page-container welcome-container">
      <h1 class="welcome-title">We always keep our tegridy.</h1>
      <img src="${resourcesPath}/mygento.svg" alt="Mygento" />
    </div>
    <a href="admin/" class="darker_than_black">admin</a>
  </body>
</html>
