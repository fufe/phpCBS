<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>phpCBS - Edit Event Details</title>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="{$themepath}admin.css" />
    </head>

    <body>
        <h1>Available Events:</h1>            
        <ul>
        {foreach from=$list item=i}
            <li><a href="index.php?action=itschedule_apply&id={$i.id}">{$i.name}</a> ----- <a href="index.php?action=itschedule_editevent&id={$i.id}">Edit</a></li>
            <ul>
                <li>{$i.description}</li>
            </ul>
        {/foreach}
        <li><a href="index.php?action=itschedule_addevent">Add new event</a></li>
        </ul>
    </body>
</html>
