#if !defined(ATTR)
#define ATTR(a,b,c)
#endif
#if !defined(ATTR_IS)
#define ATTR_IS(a,b)
#endif
#if !defined(MASK1)
#define MASK1(a,b,c,d,e,f,g,h,i,j,k,l)
#endif
#if !defined(MASK2)
#define MASK2(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t)
#endif
#if !defined(MASK3)
#define MASK3(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t)
#endif
#if !defined(MASK4)
#define MASK4(a,b,c,d)
#endif

/*
 *
 * ATTR: Setting Section Attributes
 *
 *  ATTR(id, has_arg, set_it)
 *
 *  id:        attribute name
 *  has_arg:   (0 = no, 1 = yes)
 *  set_it:    C statement to set the attribute
 *             (refers to variables sec,arg)
 *
 */

#if NO_ARGS
#define PIC30_SET_ABSOLUTE_ATTR_ARG(a) {}
#define PIC30_SET_ALIGN_ATTR_ARG(a) {}
#define PIC30_SET_MERGE_ATTR_ARG(a) {}
#define PIC30_SET_BOOT_ATTR_ARG(a) {}
#define PIC30_SET_SECURE_ATTR_ARG(a) {}
#define PIC30_SET_MEMORY_ATTR_ARG(a) {}
#define PIC30_SET_PRIORITY_ATTR_ARG(a) {}
#endif

/*
 * This is the list of "standard" attributes.
 * They are represented in COFF and ELF object
 * files using the customary section flags field.
 *
 * Do not modify this list. New attributes
 * should be added to the extended attribute
 * list which appears below.
 */
ATTR( code,    0, PIC30_SET_CODE_ATTR(sec) )
ATTR( data,    0, PIC30_SET_DATA_ATTR(sec) )
ATTR( bss,     0, PIC30_SET_BSS_ATTR(sec)  )
ATTR( persist, 0, PIC30_SET_PERSIST_ATTR(sec) )
ATTR( psv,     0, PIC30_SET_PSV_ATTR(sec) )
ATTR( eedata,  0, PIC30_SET_EEDATA_ATTR(sec) )
ATTR( memory,  1, PIC30_SET_MEMORY_ATTR(sec)
                  PIC30_SET_MEMORY_ATTR_ARG(arg) )

ATTR( address, 1, PIC30_SET_ABSOLUTE_ATTR(sec)
                  PIC30_SET_ABSOLUTE_ATTR_ARG(arg) )
ATTR( near,    0, PIC30_SET_NEAR_ATTR(sec) )
ATTR( xmemory, 0, PIC30_SET_XMEMORY_ATTR(sec) )
ATTR( ymemory, 0, PIC30_SET_YMEMORY_ATTR(sec) )
ATTR( reverse, 1, PIC30_SET_REVERSE_ATTR(sec)
                  PIC30_SET_ALIGN_ATTR_ARG(arg) )
ATTR( align,   1, PIC30_SET_ALIGN_ATTR_ARG(arg) )
ATTR( noload,  0, PIC30_SET_NOLOAD_ATTR(sec) )
ATTR( merge,   1, PIC30_SET_MERGE_ATTR(sec)
                  PIC30_SET_MERGE_ATTR_ARG(arg) )
ATTR( info,    0, PIC30_SET_INFO_ATTR(sec) )
ATTR( dma,     0, PIC30_SET_DMA_ATTR(sec) )
ATTR( boot,    0, PIC30_SET_BOOT_ATTR(sec)
                  PIC30_SET_BOOT_ATTR_ARG(arg) )
ATTR( secure,  0, PIC30_SET_SECURE_ATTR(sec)
                  PIC30_SET_SECURE_ATTR_ARG(arg) )

/*
 * This is the list of "extended" attributes.
 * They are represented in COFF and ELF object
 * files as a symbol named __ext_flags_secname
 *
 * Do not re-order this list! New attributes
 * must be added to the end. Up to 32 extended
 * attributes are supported.
 *
 * "heap" is ALWAYS the first extended attribute.
 */

ATTR( heap,    0, PIC30_SET_HEAP_ATTR(sec) )
ATTR( stack,   0, PIC30_SET_STACK_ATTR(sec) )
ATTR( eds,     0, PIC30_SET_EDS_ATTR(sec) )
ATTR( page,    0, PIC30_SET_PAGE_ATTR(sec) )
ATTR( auxflash,0, PIC30_SET_AUXFLASH_ATTR(sec) )
ATTR( packedflash, 0, PIC30_SET_PACKEDFLASH_ATTR(sec))
ATTR( keep, 0, PIC30_SET_KEEP_ATTR(sec))
ATTR( shared, 0, PIC30_SET_SHARED_ATTR(sec))
ATTR( preserved, 0, PIC30_SET_PRESERVED_ATTR(sec))
ATTR( auxpsv, 0, PIC30_SET_AUXPSV_ATTR(sec))
ATTR( update, 0, PIC30_SET_UPDATE_ATTR(sec))
ATTR( priority, 1, PIC30_SET_PRIORITY_ATTR_ARG(arg))
/*
 * ATTR_IS: Testing Section Attributes
 *
 *  ATTR_IS(id, test_it)
 *
 *  id:        attribute name
 *  test_it:   C statement to test the attribute
 *
 */

ATTR_IS( code,    PIC30_IS_CODE_ATTR(sec) )
ATTR_IS( data,    PIC30_IS_DATA_ATTR(sec) )
ATTR_IS( bss,     PIC30_IS_BSS_ATTR(sec)  )
ATTR_IS( persist, PIC30_IS_PERSIST_ATTR(sec) )
ATTR_IS( psv,     PIC30_IS_PSV_ATTR(sec) )
ATTR_IS( eedata,  PIC30_IS_EEDATA_ATTR(sec) )
ATTR_IS( memory,  PIC30_IS_MEMORY_ATTR(sec) )

ATTR_IS( address, PIC30_IS_ABSOLUTE_ATTR(sec) )
ATTR_IS( near,    PIC30_IS_NEAR_ATTR(sec) )
ATTR_IS( xmemory, PIC30_IS_XMEMORY_ATTR(sec) )
ATTR_IS( ymemory, PIC30_IS_YMEMORY_ATTR(sec) )
ATTR_IS( reverse, PIC30_IS_REVERSE_ATTR(sec) )
/* can't test for align */
ATTR_IS( noload,  PIC30_IS_NOLOAD_ATTR(sec) )
ATTR_IS( merge,   PIC30_IS_MERGE_ATTR(sec) )
ATTR_IS( info,    PIC30_IS_INFO_ATTR(sec) )
ATTR_IS( dma,     PIC30_IS_DMA_ATTR(sec) )
ATTR_IS( boot,    PIC30_IS_BOOT_ATTR(sec) )
ATTR_IS( secure,  PIC30_IS_SECURE_ATTR(sec) )

ATTR_IS( heap,    PIC30_IS_HEAP_ATTR(sec) )
ATTR_IS( stack,   PIC30_IS_STACK_ATTR(sec) )
ATTR_IS( eds,     PIC30_IS_EDS_ATTR(sec) )
ATTR_IS( page,    PIC30_IS_PAGE_ATTR(sec) )
ATTR_IS( auxflash,PIC30_IS_AUXFLASH_ATTR(sec) )
ATTR_IS( packedflash, PIC30_IS_PACKEDFLASH_ATTR(sec))
ATTR_IS( keep, PIC30_IS_KEEP_ATTR(sec))
ATTR_IS( shared, PIC30_IS_SHARED_ATTR(sec))
ATTR_IS( preserved, PIC30_IS_PRESERVED_ATTR(sec))
ATTR_IS( auxpsv, PIC30_IS_AUXPSV_ATTR(sec))
ATTR_IS( update, PIC30_IS_UPDATE_ATTR(sec))
ATTR_IS( priority, PIC30_IS_PRIORITY_ATTR(sec))

/*
 * MASK1: Attributes that represent section types
 */
MASK1( code, data, bss, persist, psv, eedata, memory, heap, stack, auxflash, \
       packedflash, auxpsv)


#define ACPT(X) (X)
#define DENY(X) (0)

/*
 * MASK2: Attributes that modify section types
 *
 * MASK2( type, modifier1, ... modifier18 )
 * template:

MASK2( xxxx, DENY(address),   DENY(near),   DENY(xmemory), DENY(ymemory), 
             DENY(reverse),   DENY(align),  DENY(noload),  DENY(merge), 
             DENY(info),      DENY(dma),    DENY(boot),    DENY(secure), 
             DENY(eds),       DENY(page),   DENY(keep),    DENY(shared), 
             DENY(preserved), DENY(update), DENY(priority))

 */

MASK2( code, ACPT(address),   DENY(near),   DENY(xmemory), DENY(ymemory), 
             DENY(reverse),   ACPT(align),  ACPT(noload),  ACPT(merge), 
             ACPT(info),      DENY(dma),    ACPT(boot),    ACPT(secure), 
             DENY(eds),       ACPT(page),   ACPT(keep),    ACPT(shared), 
             DENY(preserved), DENY(update), ACPT(priority))

MASK2( data, ACPT(address),   ACPT(near),   ACPT(xmemory), ACPT(ymemory), 
             ACPT(reverse),   ACPT(align),  ACPT(noload),  ACPT(merge), 
             ACPT(info),      ACPT(dma),    ACPT(boot),    ACPT(secure), 
             ACPT(eds),       ACPT(page),   ACPT(keep),    ACPT(shared), 
             ACPT(preserved), ACPT(update), ACPT(priority))

MASK2( bss,  ACPT(address),   ACPT(near),   ACPT(xmemory), ACPT(ymemory),
             ACPT(reverse),   ACPT(align),  ACPT(noload),  DENY(merge),
             ACPT(info),      ACPT(dma),    ACPT(boot),    ACPT(secure),
             ACPT(eds),       ACPT(page),   ACPT(keep),    ACPT(shared),
             ACPT(preserved), ACPT(update), ACPT(priority))

MASK2( persist, ACPT(address),   ACPT(near),   ACPT(xmemory), ACPT(ymemory),
                ACPT(reverse),   ACPT(align),  ACPT(noload),  DENY(merge),
                DENY(info),      ACPT(dma),    DENY(boot),    DENY(secure),
                ACPT(eds),       ACPT(page),   ACPT(keep),    ACPT(shared),
                ACPT(preserved), ACPT(update), DENY(priority))

MASK2( psv,  ACPT(address),   DENY(near),   DENY(xmemory), DENY(ymemory),
             ACPT(reverse),   ACPT(align),  ACPT(noload),  ACPT(merge),
             DENY(info),      DENY(dma),    ACPT(boot),    ACPT(secure),
             DENY(eds),       ACPT(page),   ACPT(keep),    ACPT(shared),
             DENY(preserved), DENY(update), DENY(priority))

MASK2( eedata, ACPT(address),   DENY(near),   DENY(xmemory), DENY(ymemory),
               ACPT(reverse),   ACPT(align),  ACPT(noload),  ACPT(merge),
               DENY(info),      DENY(dma),    ACPT(boot),    ACPT(secure),
               DENY(eds),       DENY(page),   ACPT(keep),    ACPT(shared),
               DENY(preserved), DENY(update), DENY(priority))

MASK2( memory, ACPT(address),   DENY(near),   DENY(xmemory), DENY(ymemory),
               ACPT(reverse),   ACPT(align),  ACPT(noload),  DENY(merge),
               DENY(info),      DENY(dma),    DENY(boot),    DENY(secure),
               DENY(eds),       DENY(page),   ACPT(keep),    ACPT(shared),
               ACPT(preserved), ACPT(update), DENY(priority))

MASK2( heap, ACPT(address),   ACPT(near),   ACPT(xmemory), ACPT(ymemory),
             DENY(reverse),   ACPT(align),  DENY(noload),  DENY(merge),
             DENY(info),      DENY(dma),    DENY(boot),    DENY(secure),
             ACPT(eds),       DENY(page),   ACPT(keep),    DENY(shared),
             DENY(preserved), DENY(update), DENY(priority))

MASK2( stack, ACPT(address),   DENY(near),   DENY(xmemory), DENY(ymemory),
              DENY(reverse),   ACPT(align),  DENY(noload),  DENY(merge),
              DENY(info),      DENY(dma),    DENY(boot),    DENY(secure),
              DENY(eds),       DENY(page),   ACPT(keep),    ACPT(shared),
              DENY(preserved), DENY(update), DENY(priority))

MASK2( auxflash, ACPT(address),   DENY(near),   DENY(xmemory), DENY(ymemory),
                 DENY(reverse),   ACPT(align),  ACPT(noload),  ACPT(merge),
                 DENY(info),      DENY(dma),    DENY(boot),    DENY(secure),
                 DENY(eds),       ACPT(page),   ACPT(keep),    ACPT(shared),
                 DENY(preserved), DENY(update), ACPT(priority))

MASK2( packedflash, DENY(address),   DENY(near),   DENY(xmemory), DENY(ymemory),
                    DENY(reverse),   DENY(align),  DENY(noload),  DENY(merge),
                    DENY(info),      DENY(dma),    DENY(boot),    DENY(secure),
                    DENY(eds),       DENY(page),   ACPT(keep),    ACPT(shared),
                    DENY(preserved), DENY(update), DENY(priority))

MASK2( auxpsv, ACPT(address),   DENY(near),   DENY(xmemory), DENY(ymemory),
               ACPT(reverse),   ACPT(align),  ACPT(noload),  ACPT(merge),
               DENY(info),      DENY(dma),    ACPT(boot),    ACPT(secure),
               DENY(eds),       ACPT(page),   ACPT(keep),    ACPT(shared),
               DENY(preserved), DENY(update), DENY(priority))

/*
 * MASK3: Attributes that may be used in combination
 *
 * MASK3( key, attr1, ... attr16)
 * template:

MASK3( xxxx, DENY(address),   DENY(near),   DENY(xmemory), DENY(ymemory), 
             DENY(reverse),   DENY(align),  DENY(noload),  DENY(merge), 
             DENY(info),      DENY(dma),    DENY(boot),    DENY(secure), 
             DENY(eds),       DENY(page),   DENY(keep),    DENY(shared), 
             DENY(preserved), DENY(update), DENY(priority))
 */

MASK3( address, DENY(address),   ACPT(near),   ACPT(xmemory), ACPT(ymemory),
                DENY(reverse),   DENY(align),  ACPT(noload),  DENY(merge),
                DENY(info),      ACPT(dma),    ACPT(boot),    ACPT(secure),
                ACPT(eds),       ACPT(page),   ACPT(keep),    ACPT(shared),
                ACPT(preserved), ACPT(update), ACPT(priority))

MASK3( near, ACPT(address),   DENY(near),   ACPT(xmemory), ACPT(ymemory),
             ACPT(reverse),   ACPT(align),  ACPT(noload),  ACPT(merge),
             DENY(info),      DENY(dma),    DENY(boot),    DENY(secure),
             DENY(eds),       DENY(page),   ACPT(keep),    ACPT(shared),
             ACPT(preserved), ACPT(update), ACPT(priority))

MASK3( xmemory, ACPT(address),   ACPT(near),   DENY(xmemory), DENY(ymemory),
                ACPT(reverse),   ACPT(align),  ACPT(noload),  ACPT(merge),
                DENY(info),      DENY(dma),    DENY(boot),    DENY(secure),
                ACPT(eds),       ACPT(page),   ACPT(keep),    ACPT(shared),
                ACPT(preserved), ACPT(update), ACPT(priority))

MASK3( ymemory, ACPT(address),   ACPT(near),   DENY(xmemory), DENY(ymemory),
                ACPT(reverse),   ACPT(align),  ACPT(noload),  ACPT(merge),
                DENY(info),      DENY(dma),    DENY(boot),    DENY(secure),
                ACPT(eds),       ACPT(page),   ACPT(keep),    ACPT(shared),
                ACPT(preserved), ACPT(update), ACPT(priority))

MASK3( reverse, DENY(address),   ACPT(near),   ACPT(xmemory), ACPT(ymemory),
                DENY(reverse),   DENY(align),  ACPT(noload),  ACPT(merge),
                DENY(info),      ACPT(dma),    ACPT(boot),    ACPT(secure),
                ACPT(eds),       ACPT(page),   ACPT(keep),    ACPT(shared),
                ACPT(preserved), ACPT(update), ACPT(priority))

MASK3( align, ACPT(address),   ACPT(near),   ACPT(xmemory), ACPT(ymemory),
              DENY(reverse),   DENY(align),  ACPT(noload),  ACPT(merge),
              DENY(info),      ACPT(dma),    ACPT(boot),    ACPT(secure),
              ACPT(eds),       ACPT(page),   ACPT(keep),    ACPT(shared),
              ACPT(preserved), ACPT(update), ACPT(priority))

MASK3( noload, ACPT(address),   ACPT(near),   ACPT(xmemory), ACPT(ymemory),
               ACPT(reverse),   ACPT(align),  DENY(noload),  DENY(merge),
               DENY(info),      ACPT(dma),    ACPT(boot),    ACPT(secure),
	       ACPT(eds),       ACPT(page),   ACPT(keep),    ACPT(shared),
	       ACPT(preserved), ACPT(update), DENY(priority))

MASK3( merge, DENY(address),   ACPT(near),   ACPT(xmemory), ACPT(ymemory),
              ACPT(reverse),   ACPT(align),  DENY(noload),  DENY(merge),
              DENY(info),      DENY(dma),    DENY(boot),    DENY(secure),
              ACPT(eds),       ACPT(page),   ACPT(keep),    ACPT(shared),
              ACPT(preserved), ACPT(update), DENY(priority))

MASK3( dma,  ACPT(address),   DENY(near),   DENY(xmemory), DENY(ymemory),
             ACPT(reverse),   ACPT(align),  ACPT(noload),  DENY(merge),
             DENY(info),      DENY(dma),    DENY(boot),    DENY(secure),
             ACPT(eds),       ACPT(page),   ACPT(keep),    ACPT(shared),
             ACPT(preserved), ACPT(update), ACPT(priority))

MASK3( boot, ACPT(address),   DENY(near),   DENY(xmemory), DENY(ymemory),
             ACPT(reverse),   ACPT(align),  ACPT(noload),  DENY(merge),
             DENY(info),      DENY(dma),    DENY(boot),    DENY(secure),
             ACPT(eds),       ACPT(page),   ACPT(keep),    ACPT(shared),
             DENY(preserved), DENY(update), ACPT(priority))

MASK3( secure, ACPT(address),   DENY(near),   DENY(xmemory), DENY(ymemory),
               ACPT(reverse),   ACPT(align),  ACPT(noload),  DENY(merge),
               DENY(info),      DENY(dma),    DENY(boot),    DENY(secure),
               ACPT(eds),       ACPT(page),   ACPT(keep),    ACPT(shared),
               DENY(preserved), DENY(update), ACPT(priority))

/* orginal allowed near --- why? */
MASK3( eds,  ACPT(address),   DENY(near),   ACPT(xmemory), ACPT(ymemory),
             ACPT(reverse),   ACPT(align),  ACPT(noload),  ACPT(merge),
             DENY(info),      ACPT(dma),    ACPT(boot),    ACPT(secure),
             DENY(eds),       ACPT(page),   ACPT(keep),    ACPT(shared),
             ACPT(preserved), ACPT(update), ACPT(priority))

MASK3( page, ACPT(address),   ACPT(near),   ACPT(xmemory), ACPT(ymemory),
             ACPT(reverse),   ACPT(align),  ACPT(noload),  ACPT(merge),
             DENY(info),      ACPT(dma),    ACPT(boot),    ACPT(secure),
             ACPT(eds),       DENY(page),   ACPT(keep),    ACPT(shared),
             ACPT(preserved), ACPT(update), ACPT(priority))

/* original allowed shared with info... which is not required */
MASK3( info, DENY(address),   DENY(near),   DENY(xmemory), DENY(ymemory),
             DENY(reverse),   DENY(align),  DENY(noload),  DENY(merge),
             DENY(info),      DENY(dma),    DENY(boot),    DENY(secure),
             DENY(eds),       DENY(page),   ACPT(keep),    DENY(shared),
             DENY(preserved), DENY(update), DENY(priority))

MASK3( keep, ACPT(address),   ACPT(near),   ACPT(xmemory), ACPT(ymemory),
             ACPT(reverse),   ACPT(align),  ACPT(noload),  ACPT(merge),
             ACPT(info),      ACPT(dma),    ACPT(boot),    ACPT(secure),
             ACPT(eds),       ACPT(page),   ACPT(keep),    ACPT(shared),
             ACPT(preserved), ACPT(update), ACPT(priority))

MASK3( shared, ACPT(address),   ACPT(near),   ACPT(xmemory), ACPT(ymemory),
               ACPT(reverse),   ACPT(align),  ACPT(noload),  ACPT(merge),
               DENY(info),      ACPT(dma),    ACPT(boot),    ACPT(secure),
               ACPT(eds),       ACPT(page),   ACPT(keep),    DENY(shared),
               ACPT(preserved), ACPT(update), ACPT(priority))

MASK3( preserved, ACPT(address),   ACPT(near),   ACPT(xmemory), ACPT(ymemory),
                  ACPT(reverse),   ACPT(align),  ACPT(noload),  ACPT(merge),
                  DENY(info),      ACPT(dma),    ACPT(boot),    ACPT(secure),
                  ACPT(eds),       ACPT(page),   ACPT(keep),    ACPT(shared),
                  DENY(preserved), DENY(update), ACPT(priority))

MASK3( update, ACPT(address),   ACPT(near),   ACPT(xmemory), ACPT(ymemory),
               ACPT(reverse),   ACPT(align),  ACPT(noload),  ACPT(merge),
               DENY(info),      ACPT(dma),    ACPT(boot),    ACPT(secure),
               ACPT(eds),       ACPT(page),   ACPT(keep),    ACPT(shared),
               DENY(preserved), DENY(update), ACPT(priority))

MASK3( priority, ACPT(address),   ACPT(near),   ACPT(xmemory), ACPT(ymemory),
                 ACPT(reverse),   ACPT(align),  DENY(noload),  DENY(merge),
                 DENY(info),      ACPT(dma),    ACPT(boot),    ACPT(secure),
                 ACPT(eds),       ACPT(page),   ACPT(keep),    ACPT(shared),
                 ACPT(preserved), ACPT(update), DENY(priority))

/*
 * MASK4: Reserved section names with implied attributes
 *
 *  MASK4( name, quiet, type, modifier)
 *
 *  name:     reserved section name
 *  quiet:    set implied attribute(s) quietly?
 *            (0 = no, 1 = yes)
 *  type:     attribute that describes type
 *  modifier: attribute that modifies type
 *   
 */
MASK4( .text,    1, code, 0 )
MASK4( .data,    1, data, 0 )
MASK4( .bss,     1, bss, 0 )
MASK4( .xbss,    0, bss, xmemory )
MASK4( .xdata,   0, data, xmemory )
MASK4( .nbss,    0, bss, near )
MASK4( .ndata,   0, data, near )
MASK4( .ndconst, 0, data, near )
MASK4( .pbss,    0, persist, 0 )
MASK4( .dconst,  0, data, 0 )
MASK4( .ybss,    0, bss, ymemory )
MASK4( .ydata,   0, data, ymemory )
MASK4( .const,   0, psv, 0 )
MASK4( .eedata,  0, eedata, 0 )

