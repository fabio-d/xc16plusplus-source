/*
 *  A new mode for C30
 */

/* 
    P24PSV represents a small (__psv__) pointer
    P24PROG represetns a large (__prog__) pointer
*/

FRACT_MODE (QQ, 2, 15); /* s.15 */
FRACT_MODE (HQ, 2, 15); /* s.15 */
FRACT_MODE (SQ, 4, 31); /* s.31 */
FRACT_MODE (DQ, 4, 31); /* s.31 */
FRACT_MODE (TQ, 4, 31); /* s.31 */

UFRACT_MODE (UQQ, 2, 15); /* .15 */
UFRACT_MODE (UHQ, 2, 15); /* .15 */
UFRACT_MODE (USQ, 4, 31); /* .31 */
UFRACT_MODE (UDQ, 4, 31); /* .31 */
UFRACT_MODE (UTQ, 4, 31); /* .31 */

ACCUM_MODE (HA, 6, 9, 31); /* s8.31 */
ACCUM_MODE (SA, 6, 9, 31); /* s8.31 */
ACCUM_MODE (DA, 6, 9, 31); /* s8.31 */
ACCUM_MODE (TA, 6, 9, 31); /* s8.31 */

UACCUM_MODE (UHA, 6, 9, 31); /* 9.31 */
UACCUM_MODE (USA, 6, 9, 31); /* 9.31 */
UACCUM_MODE (UDA, 6, 9, 31); /* 9.31 */
UACCUM_MODE (UTA, 6, 9, 31); /* 9.31 */

TARGET_POINTER_MODE(P24PROG, 24, 4);  // __prog__ pointer
TARGET_POINTER_MODE(P24PSV,  24, 4);  // __psv__ pointer
TARGET_POINTER_MODE(P16APSV, 16, 2);  // const pointer in auto_psv model 
TARGET_POINTER_MODE(P16PMP,  16, 2);  // __pmp__ pointer
TARGET_POINTER_MODE(P32EXT,  32, 4);  // __external__ pointer
TARGET_POINTER_MODE(P32EDS,  32, 4);  // __eds__ pointer
TARGET_POINTER_MODE(P32PEDS, 32, 4);  // paged __eds__ pointer
TARGET_POINTER_MODE(P32DF,   32, 4);  // __packed data flash pointer

