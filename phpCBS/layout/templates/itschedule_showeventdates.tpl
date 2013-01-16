<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>phpCBS - Show Event Dates</title>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="{$themepath}admin.css" />
    </head>

    <body>
        <h1>Available dates:</h1>            
        <div id="data">
            <table>
                <tr>
                    <th>Date</th>
                    <th>Day of week</th>
                    <th>Laptop users</th>
                    <th>Desktop users</th>
                </tr>                   
                {foreach from=$list item=i}
                    <tr>
                        <td>{$i.eventdate}</td>
                        <td>{$i.eventdayofweek}</td>
                        {if $i.isenabled}
                    {if $i.islaptopbookable}<td bgcolor="lightgreen"><a href="{$SCRIPT_NAME}?action=itschedule_showuserdetailsform&eventdateid={$i.eventdateid}&devicetype=laptop" />Book laptop here.</td>{else}<td bgcolor="red">No laptop slot left.</td>{/if}
            {if $i.isdesktopbookable}<td bgcolor="lightgreen"><a href="{$SCRIPT_NAME}?action=itschedule_showuserdetailsform&eventdateid={$i.eventdateid}&devicetype=desktop" />Book desktop here.</td>{else}<td bgcolor="red">No desktop slot left.</td>{/if}
        {else}
            <td colspan="2">No bookings for this day</td>
        {/if}
    </tr>
{/foreach}
</table>
</body>
</html>
