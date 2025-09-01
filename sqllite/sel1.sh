 aqlite "select  name from  temp.sqlite_master " -v -schema:data/dmmeta
 aqlite "select  name from  temp.sqlite_masterxxx where  type='table'" -v -schema:data/dmmeta