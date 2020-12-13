<?php
class DB_Functions {
  protected $db_connection;

  public function DB_Functions($db_conn) {
    $this->db_connection = $db_conn;
  }

  public function run_sql($sql) {
    $query = mysqli_query($this->db_connection, $sql);

    if (!$query) {
        die(mysqli_error($query));
    }

    return $query;
  }
}
?>