#include "../include/string.h"

#define CASES_NO 4
struct {
        const char   src[CASES_NO][32];
        char         dest[CASES_NO][32];
        int          len[CASES_NO];
} cases = {
        .src  = { "7chars", "8chars ", "9chars  ", "" },
        .len  = { 7,        8,         9,          1  }
};


int
main(void)
{
        char    *ret;
        int      i;

        for (i = 0; i < CASES_NO; ++i) {
                ret = stpcpy(cases.dest[i], cases.src[i]);
                if (ret != cases.dest[i] + cases.len[i] - 1)
                        return 1;
        }

        return 0;
}
