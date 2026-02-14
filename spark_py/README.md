# Spark client

### install 

```
wget https://dlcdn.apache.org/spark/spark-4.1.1/spark-4.1.1-bin-hadoop3.tgz


tar xvf spark-4.1.1-bin-hadoop3.tgz
sudo mv spark-4.1.1-bin-hadoop3 /opt/spark


cp /opt/spark/conf/log4j2.properties.template \
   /opt/spark/conf/log4j2.properties

nano /opt/spark/conf/log4j2.properties


change to 

rootLogger.level = error
```

### run 
```
```

### errors in comp

```
==Starting streaming query to Delta table...
Traceback (most recent call last):
  File "/home/avorovich/av_openacr/spark_py/spark_kafka.py", line 44, in <module>
    .start(DELTA_PATH)  # <-- use .start(path) for file-based Delta table
     ^^^^^^^^^^^^^^^^^
  File "/opt/spark/python/lib/pyspark.zip/pyspark/sql/streaming/readwriter.py", line 1706, in start
  File "/opt/spark/python/lib/py4j-0.10.9.9-src.zip/py4j/java_gateway.py", line 1362, in __call__
  File "/opt/spark/python/lib/pyspark.zip/pyspark/errors/exceptions/captured.py", line 263, in deco
  File "/opt/spark/python/lib/py4j-0.10.9.9-src.zip/py4j/protocol.py", line 327, in get_return_value
py4j.protocol.Py4JJavaError: An error occurred while calling o48.start.
: java.lang.NoClassDefFoundError: org/apache/spark/sql/execution/streaming/StreamingRelation
        at org.apache.spark.sql.delta.DeltaAnalysis.$anonfun$verifyDeltaSourceSchemaLocation$1(DeltaAnalysis.scala:1272)
        at org.apache.spark.sql.delta.DeltaAnalysis.$anonfun$verifyDeltaSourceSchemaLocation$1$adapted(DeltaAnalysis.scala:1271)
        at org.apache.spark.sql.catalyst.trees.TreeNode.foreach(TreeNode.scala:263)
        at org.apache.spark.sql.delta.DeltaAnalysis.org$apache$spark$sql$delta$DeltaAnalysis$$verifyDeltaSourceSchemaLocation(DeltaAnalysis.scala:1271)
        at org.apache.spark.sql.delta.DeltaAnalysis$$anonfun$apply$1.applyOrElse(DeltaAnalysis.scala:646)
        at org.apache.spark.sql.delta.DeltaAnalysis$$anonfun$apply$1.applyOrElse(DeltaAnalysis.scala:85)
        at org.apache.spark.sql.catalyst.plans.logical.AnalysisHelper.$anonfun$resolveOperatorsDownWithPruning$2(AnalysisHelper.scala:200)
        at org.apache.spark.sql.catalyst.trees.CurrentOrigin$.withOrigin(origin.scala:107)
        at org.apache.spark.sql.catalyst.plans.logical.AnalysisHelper.$anonfun$resolveOperatorsDownWithPruning$1(AnalysisHelper.scala:200)
        at org.apache.spark.sql.catalyst.plans.logical.AnalysisHelper$.allowInvokingTransformsInAnalyzer(AnalysisHelper.scala:416)
        at org.apache.spark.sql.catalyst.plans.logical.AnalysisHelper.resolveOperatorsDownWithPruning(AnalysisHelper.scala:198)
        at org.apache.spark.sql.catalyst.plans.logical.AnalysisHelper.resolveOperatorsDownWithPruning$(AnalysisHelper.scala:194)
        at org.apache.spark.sql.catalyst.plans.logical.LogicalPlan.resolveOperatorsDownWithPruning(LogicalPlan.scala:37)
        at org.apache.spark.sql.catalyst.plans.logical.AnalysisHelper.resolveOperatorsDown(AnalysisHelper.scala:190)
        at org.apache.spark.sql.catalyst.plans.logical.AnalysisHelper.resolveOperatorsDown$(AnalysisHelper.scala:189)
        at org.apache.spark.sql.catalyst.plans.logical.LogicalPlan.resolveOperatorsDown(LogicalPlan.scala:37)
        at org.apache.spark.sql.delta.DeltaAnalysis.apply(DeltaAnalysis.scala:85)
        at org.apache.spark.sql.delta.DeltaAnalysis.apply(DeltaAnalysis.scala:80)
        at org.apache.spark.sql.catalyst.rules.RuleExecutor.$anonfun$execute$2(RuleExecutor.scala:248)
        at scala.collection.LinearSeqOps.foldLeft(LinearSeq.scala:183)
        at scala.collection.LinearSeqOps.foldLeft$(LinearSeq.scala:179)
        at scala.collection.immutable.List.foldLeft(List.scala:79)
        at org.apache.spark.sql.catalyst.rules.RuleExecutor.$anonfun$execute$1(RuleExecutor.scala:245)
        at org.apache.spark.sql.catalyst.rules.RuleExecutor.$anonfun$execute$1$adapted(RuleExecutor.scala:237)
        at scala.collection.immutable.List.foreach(List.scala:323)
        at org.apache.spark.sql.catalyst.rules.RuleExecutor.execute(RuleExecutor.scala:237)
        at org.apache.spark.sql.catalyst.analysis.Analyzer.org$apache$spark$sql$catalyst$analysis$Analyzer$$executeSameContext(Analyzer.scala:343)
        at org.apache.spark.sql.catalyst.analysis.Analyzer.$anonfun$execute$1(Analyzer.scala:339)
        at org.apache.spark.sql.catalyst.analysis.AnalysisContext$.withNewAnalysisContext(Analyzer.scala:224)
        at org.apache.spark.sql.catalyst.analysis.Analyzer.execute(Analyzer.scala:339)
        at org.apache.spark.sql.catalyst.analysis.Analyzer.execute(Analyzer.scala:289)
        at org.apache.spark.sql.catalyst.rules.RuleExecutor.$anonfun$executeAndTrack$1(RuleExecutor.scala:207)
        at org.apache.spark.sql.catalyst.QueryPlanningTracker$.withTracker(QueryPlanningTracker.scala:89)
        at org.apache.spark.sql.catalyst.rules.RuleExecutor.executeAndTrack(RuleExecutor.scala:207)
        at org.apache.spark.sql.catalyst.analysis.resolver.HybridAnalyzer.resolveInFixedPoint(HybridAnalyzer.scala:236)
        at org.apache.spark.sql.catalyst.analysis.resolver.HybridAnalyzer.$anonfun$apply$1(HybridAnalyzer.scala:91)
        at org.apache.spark.sql.catalyst.analysis.resolver.HybridAnalyzer.withTrackedAnalyzerBridgeState(HybridAnalyzer.scala:122)
        at org.apache.spark.sql.catalyst.analysis.resolver.HybridAnalyzer.apply(HybridAnalyzer.scala:84)
        at org.apache.spark.sql.catalyst.analysis.Analyzer.$anonfun$executeAndCheck$1(Analyzer.scala:322)
        at org.apache.spark.sql.catalyst.plans.logical.AnalysisHelper$.markInAnalyzer(AnalysisHelper.scala:423)
        at org.apache.spark.sql.catalyst.analysis.Analyzer.executeAndCheck(Analyzer.scala:322)
        at org.apache.spark.sql.execution.QueryExecution.$anonfun$lazyAnalyzed$2(QueryExecution.scala:139)
        at org.apache.spark.sql.catalyst.QueryPlanningTracker.measurePhase(QueryPlanningTracker.scala:148)
        at org.apache.spark.sql.execution.QueryExecution.$anonfun$executePhase$2(QueryExecution.scala:330)
        at org.apache.spark.sql.execution.QueryExecution$.withInternalError(QueryExecution.scala:717)
        at org.apache.spark.sql.execution.QueryExecution.$anonfun$executePhase$1(QueryExecution.scala:330)
        at org.apache.spark.sql.SparkSession.withActive(SparkSession.scala:804)
        at org.apache.spark.sql.execution.QueryExecution.executePhase(QueryExecution.scala:329)
        at org.apache.spark.sql.execution.QueryExecution.$anonfun$lazyAnalyzed$1(QueryExecution.scala:139)
        at scala.util.Try$.apply(Try.scala:217)
        at org.apache.spark.util.Utils$.doTryWithCallerStacktrace(Utils.scala:1392)
        at org.apache.spark.util.LazyTry.tryT$lzycompute(LazyTry.scala:46)
        at org.apache.spark.util.LazyTry.tryT(LazyTry.scala:46)
        at org.apache.spark.util.LazyTry.get(LazyTry.scala:58)
        at org.apache.spark.sql.execution.QueryExecution.analyzed(QueryExecution.scala:150)
        at org.apache.spark.sql.classic.StreamingQueryManager.createQuery(StreamingQueryManager.scala:222)
        at org.apache.spark.sql.classic.StreamingQueryManager.startQuery(StreamingQueryManager.scala:303)
        at org.apache.spark.sql.classic.DataStreamWriter.startQuery(DataStreamWriter.scala:324)
        at org.apache.spark.sql.classic.DataStreamWriter.startInternal(DataStreamWriter.scala:293)
        at org.apache.spark.sql.classic.DataStreamWriter.start(DataStreamWriter.scala:132)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)
        at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.base/java.lang.reflect.Method.invoke(Method.java:569)
        at py4j.reflection.MethodInvoker.invoke(MethodInvoker.java:244)
        at py4j.reflection.ReflectionEngine.invoke(ReflectionEngine.java:374)
        at py4j.Gateway.invoke(Gateway.java:282)
        at py4j.commands.AbstractCommand.invokeMethod(AbstractCommand.java:132)
        at py4j.commands.CallCommand.execute(CallCommand.java:79)
        at py4j.ClientServerConnection.waitForCommands(ClientServerConnection.java:184)
        at py4j.ClientServerConnection.run(ClientServerConnection.java:108)
        at java.base/java.lang.Thread.run(Thread.java:840)
Caused by: java.lang.ClassNotFoundException: org.apache.spark.sql.execution.streaming.StreamingRelation
        at java.base/java.net.URLClassLoader.findClass(URLClassLoader.java:445)
        at java.base/java.lang.ClassLoader.loadClass(ClassLoader.java:592)
        at java.base/java.lang.ClassLoader.loadClass(ClassLoader.java:525)
        ... 72 more
```
for non catalog wit 4.0 lake.. 
java.lang.NoClassDefFoundError: org/apache/spark/sql/execution/streaming/StreamingRelation

..for catalog option
Caused by: java.lang.ClassNotFoundException: org.apache.spark.sql.delta.catalog.DeltaCatalog