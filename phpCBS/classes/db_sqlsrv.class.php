<?php

/*
 * Database class for MS SQL PDO object.
 * 
 */

class db_sqlsrv {

    // database object
    var $dbh = null;

    /**
     * class constructor
     */
    function __construct($config = array()) {
        // instantiate the pdo object
        try {
            $dsn = "{$config['db_engine']}:server={$config['db_server']};database={$config['db_database']}";
            $this->dbh = new PDO($dsn, $config['db_username'], $config['db_password']);
            $this->dbh->query('SET NAMES utf8');
        } catch (PDOException $e) {
            print "Error!: " . $e->getMessage();
            die();
        }
    }
    
    function getITScheduleEventsList(){
        $sth = $this->dbh->query("SELECT * FROM itschedule_events");
        while ($row = $sth->fetch (PDO::FETCH_ASSOC)){
            $list[] = $row;
        }
        return $list;
    }
    
    function getITScheduleEventDetailsById($id){
        $sth = $this->dbh->query("SELECT * FROM itschedule_events WHERE id=$id");
        $data = $sth->fetch (PDO::FETCH_ASSOC);
        return $data;
    }
    
    function addITScheduleEvent($data){
        $sth = $this->dbh->prepare("INSERT INTO itschedule_events (name,description,datestart,dateend,isweekends,maxapplicationsperuser,maxdesktopperday,maxlaptopperday,isenabled) 
            VALUES (:name,:description,:datestart,:dateend,:isweekends,:maxapplicationsperuser,:maxdesktopperday,:maxlaptopperday,:isenabled)");
        $sth->bindParam(":name", $data["name"]);
        $sth->bindParam(":description", $data["description"]);
        $sth->bindParam(":datestart", $data["datestart"]);
        $sth->bindParam(":dateend", $data["dateend"]);
        $sth->bindParam(":isweekends", $data["isweekends"]);
        $sth->bindParam(":maxapplicationsperuser", $data["maxapplicationsperuser"]);
        $sth->bindParam(":maxdesktopperday", $data["maxdesktopperday"]);
        $sth->bindParam(":maxlaptopperday", $data["maxlaptopperday"]);
        $sth->bindParam(":isenabled", $data["isenabled"]);
        return $sth->execute();
    }

    function updateITScheduleEvent($data){
        $sth = $this->dbh->prepare("UPDATE itschedule_events SET name=:name,description=:description,datestart=:datestart,dateend=:dateend,
            isweekends=:isweekends,maxapplicationsperuser=:maxapplicationsperuser,maxdesktopperday=:maxdesktopperday,
            maxlaptopperday=:maxlaptopperday,isenabled=:isenabled
            WHERE id=:id");
        $sth->bindParam(":name", $data["name"]);
        $sth->bindParam(":description", $data["description"]);
        $sth->bindParam(":datestart", $data["datestart"]);
        $sth->bindParam(":dateend", $data["dateend"]);
        $sth->bindParam(":isweekends", $data["isweekends"]);
        $sth->bindParam(":maxapplicationsperuser", $data["maxapplicationsperuser"]);
        $sth->bindParam(":maxdesktopperday", $data["maxdesktopperday"]);
        $sth->bindParam(":maxlaptopperday", $data["maxlaptopperday"]);
        $sth->bindParam(":isenabled", $data["isenabled"]);
        $sth->bindParam(":id", $data["id"]);
        return $sth->execute();
    }
    
}
