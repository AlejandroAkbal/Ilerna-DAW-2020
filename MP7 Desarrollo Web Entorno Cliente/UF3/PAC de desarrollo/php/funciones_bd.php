<?php

abstract class DB_Factory {
  protected $db_connection;

  public function DB_Factory($db_conn) {
    $this->db_connection = $db_conn;
  }
}

class DB_Functions extends DB_Factory {
  public function run_sql($sql) {
    $query = $this->db_connection->query($sql);

    if (!$query) {
      $message = "Query to database failed: {$this->db_connection->error}";
            
      die($message);
    }

    return $query;
  }
}
?>