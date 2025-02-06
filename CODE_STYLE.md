# style questions

## pointer and reference names
```
static atf_spdk::FReq* CreateReq(atf_spdk::FNs *fns) {
    atf_spdk::FReq *req= &atf_spdk::req_Alloc();
    req->p_ns = fns;
```
-when to use lower case f{type}? should this be instead  (with "f") :? 
```
    atf_spdk::FReq *freq= &atf_spdk::req_Alloc();
```
-when to use p_{type} ?

## exit on err
```
    if (_db.cmdline.test && cd_selns_EmptyQ()) {
        prlog("No namespaces matched selector. Try with -list flag to see the list of available namespaces");
        algo_lib::_db.exit_code=1;
    }

    if (_db.cmdline.test) {
        RunTest();
    }
```

Is it desirable to enter RunTest after algo_lib::_db.exit_code=1; relying on a separate fact that cd_selns  is empty or should there be an 
explict test on algo_lib::_db.exit_code=1; ??
If yes, what is the style ? nested if ? goto err ?
