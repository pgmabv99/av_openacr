omcli -omnode:dev.x2-4.%  -dkr_clean_run

x2rel -create -product:x2
x2rel -product:x2 -omnode:dev.x2-4.x2-1    -upload -dev
rsync  -ac --delete  --exclude=build/x2ui --exclude=node_modules --exclude=temp/* --exclude=ts . x2usr@dev.x2-17:arnd
for i in 1 2 3 4; do
  x2rel -product:x2 -omnode:dev.x2-4.x2-%    -upload -dev;
done


omcli -omnode:dev.x2-4.%  -start_clean
omcli -omnode:dev.x2-4.%  -status
omcli -omnode:dev.x2-4.%  -stop

# goto browser url