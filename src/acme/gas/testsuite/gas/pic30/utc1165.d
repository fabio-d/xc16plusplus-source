#as: -W
#objdump: -s -j foo
#name: align with max-skip in non-CODE sections (SSR# 22234)

.*:.*

Contents of section foo:
 0000 01aaaaaa 02bbbbbb                    ........        
