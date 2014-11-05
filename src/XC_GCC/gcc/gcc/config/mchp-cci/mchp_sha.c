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
along with GCC; see the file COPYING3.  If not see
<http://www.gnu.org/licenses/>.  */

#if defined(LICENSE_MANAGER_XCLM) || defined(_BUILD_SHA_CHECKSUM_)

#include <stdio.h>
#include <string.h>
#include "sha256.h"
#include "mchp_sha.h"

int mchp_sha256( const char *path, unsigned char output[65] )
{
   int i,result;
   unsigned char sha256sum[32];
   
   /* Calculate the SHA2 digest of given file */ 
   result = sha256_file( path , sha256sum, 0 );
   
   /* If valid, convert SHA digest to hex */
   if( 0 == result )
   {
      for( i=0 ; i<32 ; i++ )
      {
         sprintf( output + i * 2, "%02x", sha256sum[i] );
      }
   } 
#if defined(_BUILD_SHA_CHECKSUM_)
   else
      fprintf(stderr,"Error: cannot create hash for %s\n", path);
#endif
     
   output[64]='\0';
   return 0; 
}

int mchp_sha256_validate( const char *path, unsigned const char *sha2 )
{
   int i,result;
   unsigned char sha256sum[32],sha256hex[65];
   
   /* Determine SHA2 digest of file to be verified */
   result = sha256_file( path , sha256sum, 0 );
   
   /* If valid, convert SHA digest to hex */
   if( 0 == result )
   {
      for( i=0 ; i<32 ; i++ )
      {
         sprintf( sha256hex + i * 2, "%02x", sha256sum[i] );
      }
   }
   sha256hex[64]='\0';
  
   /* Compare the calulated SAH2 digest with known value */
   return strcmp( sha256hex , sha2 );
}
#endif

#if defined(_BUILD_SHA_CHECKSUM_)
int main( int argc, char *argv[] )
{
   unsigned char output[65];

   if (argc!=2)
   {
         fprintf(stderr, "usage: %s path_to_xclm\n", argv[0]);
         return -1;
   }
   else
   {
   	 mchp_sha256(argv[1],output);
         fprintf(stderr, "%s\n",output);
         return 1;
   }
}
#endif

