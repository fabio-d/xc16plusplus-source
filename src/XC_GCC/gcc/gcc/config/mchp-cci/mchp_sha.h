/* Subroutines used for Microchip PIC32 MCU support
   Copyright (C) 2014  
   Microchip Technology, Inc.
   Contributed by S. Bekal, swaroopkumar.bekal@microchip.com

This file is part of Microchip XC compiler tool-chain.

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3, or (at your option)
any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
alng with GCC; see the file COPYING3.  If not see
<http://www.gnu.org/licenses/>.  */

#ifndef MCHP_SHA_H
#define MCHP_SHA_H

/* SHA-256 digest of xclm executables for Win, Linux and OS X */
#if 0
#if defined(__MINGW32__)
#define MCHP_XCLM_SHA256_DIGEST   "3e832bfebeec57831d652e19a5155967b6d6c186840cd6c41c69491e6452e830"
#elif defined(__linux__)
#define MCHP_XCLM_SHA256_DIGEST   "4fae1d53570ebffe637d8c5f77789ecbe690f67af65d0e3af8474bfee479239e"
#elif defined(__MACH__)
#define MCHP_XCLM_SHA256_DIGEST   "7b68189f44d06b95b28c42acfa640e773c627e7a2793ca992999d7c41589b66a" 
#else 
#error "Unknown host"
#endif
#endif

#define STRINGIZE2(X) #X
#define STRINGIZE(X) STRINGIZE2(X)

#if !defined(_BUILD_SHA_CHECKSUM_)
#ifndef MCHP_XCLM_SHA256_DIGEST_VAL
#error Please define the correct sha hash value
#else
#define MCHP_XCLM_SHA256_DIGEST STRINGIZE(MCHP_XCLM_SHA256_DIGEST_VAL)
#endif
#endif

/* Function to calculate the SHA256 digest of given file
 * Parameters :
 *     - Absolute path to file
 *     - Buffer to hold SHA256 digest 
 * Return value :
 *     - 0 on success, non-zero on any error
*/
int mchp_sha256( const char *path, unsigned char output[32] );

/* Function to validate if the SHA256 digest of given file
 * mathces the suppiled value
 * Parameters :
 *     - Absolute path to file
 *     - Pre-calculated SHA256 digest of the file (null terminated)
 * Return value :
 *     - 0 on match, non-zero on mis-match 
*/
int mchp_sha256_validate( const char *path, unsigned const char *sha2);

#endif 
