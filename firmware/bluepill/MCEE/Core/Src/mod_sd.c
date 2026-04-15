/*
 * mod_sd.c
 *
 *  Created on: Feb 9, 2022
 *      Author: facundo
 */


/*==================[inclusions]=============================================*/
#include "mod_sd.h"
#include "mod_esp8266.h"


/*==================[macros and definitions]=================================*/
#define BUF_SIZE 512

/*==================[internal data declaration]==============================*/

/*==================[internal functions declaration]=========================*/

/*==================[internal data definition]===============================*/
FRESULT fresult;
FATFS fs;
FIL fil1;
FATFS *pfs;
char buffer_sd[BUF_SIZE];
DIR dir;
FILINFO fno;

/*==================[external data definition]===============================*/
static uint8_t fatFsCounter = 10;
extern char buffer_monitor[];

/*==================[internal functions definition]==========================*/
uint32_t SD_GetFreeSpace();

bool SD_Mount()
{
     fresult = f_mount(&fs, "", 0);

	 if(fresult != FR_OK)
		 return false;
	 else
		 return true;

}

void SD_Tick()
{
	--fatFsCounter;
	if(fatFsCounter == 0)
	{
		SD_10ms_Tick_Handler();
		fatFsCounter = 10;
	}
}

/*==================[External functions definition]==========================*/

void SD_Init( )
{
	flag_sd = false;
	SD_Mount();

	SD_CreateFile( HISTORY_FILENAME  );
}

uint32_t SD_GetFreeSpace()
{
	uint32_t free_space, free_clust;

	fresult = f_getfree("", &free_clust, &pfs);
	free_space = (uint32_t)(free_clust * pfs->csize * 0.5);

	if(fresult != FR_OK)
		 return -1;
	else
		return free_space;
}

void SD_CreateFile(char* name)
{
	fresult = f_open(&fil1, name , FA_OPEN_ALWAYS | FA_READ | FA_WRITE);

	fresult = f_puts("Monitor de signos vitales\n", &fil1);

	fresult = f_close(&fil1);
}

void SD_Writefile(char* name, char* msg)
{
	fresult = f_open(&fil1, name , FA_OPEN_ALWAYS | FA_READ | FA_WRITE);

	fresult = f_puts(msg, &fil1);

	fresult = f_close(&fil1);
}

void SD_ReadFile(char* name, char* buffer)
{
	fresult = f_open(&fil1, name, FA_READ);
	f_gets(buffer, fil1.fsize, &fil1);

	f_close(&fil1);
}



void SD_SaveData(char* str1, char* str2, char* str3)
{
	//Guardar datos en la SD
	TCHAR* f;

	fresult = f_open(&fil1, HISTORY_FILENAME , FA_OPEN_ALWAYS | FA_READ | FA_WRITE);

	for(int i = 0;;)
	{
		f = f_gets(buffer_sd, fil1.fsize, &fil1);

	//	strcat(buffer_monitor, buffer_sd);

		if (f == 0)
		{
			break;					/* Error or EOF */
		}
		bzero(buffer_sd, BUF_SIZE);
	}

	strcat( buffer_monitor, str1 );
	strcat( buffer_monitor, "_" );
	strcat( buffer_monitor, str2 );
	strcat( buffer_monitor, "_" );
	strcat( buffer_monitor, str3 );
	strcat( buffer_monitor, "\n" );

	fresult = f_puts(buffer_monitor, &fil1);

	fresult = f_close(&fil1);

	bzero(buffer_monitor, 4000);
}

