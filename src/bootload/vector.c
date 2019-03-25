#include "defines.h"

extern void start(void);        /* スタートアップルーチン */


/**
 * 割込みベクタの設定
 * リンカスクリプトの定義により、先頭番地に配置される。
 */
void (*vectors[])(void) = {
    start, NULL, NULL, NULL,NULL, NULL, NULL, NULL,
    NULL,  NULL, NULL, NULL,NULL, NULL, NULL, NULL,
    NULL,  NULL, NULL, NULL,NULL, NULL, NULL, NULL,
    NULL,  NULL, NULL, NULL,NULL, NULL, NULL, NULL,
    NULL,  NULL, NULL, NULL,NULL, NULL, NULL, NULL,
    NULL,  NULL, NULL, NULL,NULL, NULL, NULL, NULL,
    NULL,  NULL, NULL, NULL,NULL, NULL, NULL, NULL,
    NULL,  NULL, NULL, NULL,NULL, NULL, NULL, NULL,
};
