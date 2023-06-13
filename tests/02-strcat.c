#include "../include/string.h"

#define GOAL "abcd"

#define CASES_NO 3
struct {
        const char   s2s[CASES_NO][32];
        char         s1s[CASES_NO][32];
} cases = {
        .s1s = { "",        "ab",   "abcd"  },
        .s2s = { "abcd",    "cd",   ""      }
};

int
main(void)
{
        int     i, j;

        for (i = 0; i < CASES_NO; ++i) {
                if (strcat(cases.s1s[i], cases.s2s[i]) != cases.s1s[i])
                        return 1;
        }

        for (i = 0; i < CASES_NO; ++i) {
                for (j = 0; cases.s1s[i][j] != '\0'; ++j) {
                        if (cases.s1s[i][j] != GOAL[j])
                                return 1;
                }
        }

        return 0;
}
