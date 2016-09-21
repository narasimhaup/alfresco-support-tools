<#escape x as jsonUtils.encodeJSONString(x)>
{
   "myDate": "${myDate}",
   "vmName": "${vmName}",
   "vmVersion": "${vmVersion}",
   
    <#if hotThreads?? && hotThreads?size gt 0>
    "hotThreads": [
        <#list hotThreads as hotThreadsEntry>
        {
            "cpuTime": "${hotThreadsEntry.cpuTime}",
            "threadName": "${hotThreadsEntry.threadName}",
            "threadId": "${hotThreadsEntry.threadId}",
            "blockedCount": "${hotThreadsEntry.blockedCount}",
            "waitedCount": "${hotThreadsEntry.waitedCount}", 
            "waitedTime": "${hotThreadsEntry.waitedTime}",
            "threadState": "${hotThreadsEntry.threadState}",
            "stackTrace": 
            <#if hotThreadsEntry.stackTrace??>
                "${hotThreadsEntry.stackTrace}"
            <#else>
                "***Ingore this thread: this is the running process to Obtain HOTTHREADS"
            </#if>
            <#if hotThreadsEntry.lockedSynchronizers??>
            , "lockedOwnableSynchronizers" : [
                <#list hotThreadsEntry.lockedSynchronizers as lockedSynchronizersEntry>
                    {"identityHashCode": "${lockedSynchronizersEntry.identityHashCode}", "className": "${lockedSynchronizersEntry.className}"}
                    <#if lockedSynchronizersEntry_index lt hotThreadsEntry.lockedSynchronizers?size - 1>,</#if>
                </#list>
            ]
            </#if>
        }
        <#if hotThreadsEntry_index lt hotThreads?size - 1>,</#if>
        </#list>
    ],
    </#if>

   "numberOfThreads": "${numberOfThreads}",
   "deadlockedThreads": "${deadlockedThreads}"
}
</#escape>