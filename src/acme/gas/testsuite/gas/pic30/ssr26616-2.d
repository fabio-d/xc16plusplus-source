#as:
#name: Assembler merges changed section attributes, creating potential conflicts
#source: ssr26616-2.s

.+ssr26616-2.s: Assembler messages:
.+ssr26616-2.s:15: Warning: changed section attributes for foo
.+ssr26616-2.s:21: Warning: changed section attributes for foo
.+ssr26616-2.s:21: Error: invalid attribute combination for foo
.+ssr26616-2.s:27: Warning: changed section attributes for test
.+ssr26616-2.s:27: Error: invalid attribute combination for test
