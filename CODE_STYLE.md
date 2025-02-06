# style questions

## pointer and reference variable names
```
static atf_spdk::FReq* CreateReq(atf_spdk::FNs *fns) {
    atf_spdk::FReq *req= &atf_spdk::req_Alloc();
    req->p_ns = fns;
```
- q1. in this example fns variable starts with "f" and req variable does not .
Should they both start with "f" to match the type 
- q2. when to use prefix "p_"  p_{type} ?

Overall I am trying to be consistent to make it easier to move variables around

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

- Is it desirable to enter RunTest after algo_lib::_db.exit_code=1; relying on a separate fact that cd_selns  is empty or should there be an 
explict test on algo_lib::_db.exit_code=1; ??
- If yes, what is the style ? nested if ? goto err  ?

- Note that goto had religious wars around it . I was surpised to find it in spdk proper code. What is our policy on that ?
