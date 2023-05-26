#include "../include/string.h"

#include <stdio.h>

#define CASES_NO 4
struct {
        const char   src[CASES_NO][32];
        char         dest[CASES_NO][32];
        int          len[CASES_NO];
        unsigned     fin[CASES_NO];
} cases = {
        .src  = { "7chars", "8chars ", "9chars  ", "" },
        .len  = { 7,        8,         9,          1  },
        .fin  = { 4,        8,         3,          8  }
};

int
returntest(void)
{
        char    *ret;
        int      i;

        for (i = 0; i < CASES_NO; ++i) {
                ret = stpncpy(cases.dest[i], cases.src[i], cases.fin[i]);
                if (ret != cases.dest[i] + cases.fin[i] - 1)
                        return 1;
        }

        return 0;
}

int
copytest(void)
{
        int      i, j;
        char     exp;

        for (i = 0; i < CASES_NO; ++i) {
                for (j = 0; j < cases.fin[i]; ++j) {
                        exp = j >= cases.len[i] ? '\0' : cases.src[i][j];
                        if (cases.dest[i][j] != exp)
                                return 1;
                }
        }

        return 0;
}

int
main(void)
{
        if (returntest() || copytest())
                return 1;

        return 0;
}
