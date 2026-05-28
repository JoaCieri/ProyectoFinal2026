/*
 * mod_sd.h
 *
 *  Created on: Feb 9, 2022
 *      Author: facundo
 */

#ifndef INC_MOD_SD_H_
#define INC_MOD_SD_H_

/*==================[inclusions]=============================================*/
#include "main.h"
#include "stdbool.h"
#include <stdio.h>
#include "string.h"
#include <strings.h>
#include <math.h>

#include "fatfs.h"
#include "fatfs_sd.h"

/*==================[macros]=================================================*/

/*==================[typedef]================================================*/

/*==================[external data declaration]==============================*/

/*==================[external functions declaration]=========================*/

void SD_Tick();

void SD_Init();

void SD_CreateFile(char* name);

void SD_ListDir();

bool SD_Exist(char* file);



#endif /* INC_MOD_SD_H_ */
