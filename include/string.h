#ifndef AMD64STRING_H
#define AMD64STRING_H

#include <stddef.h>

void     *memccpy(void *, const void *, int, size_t);
char     *stpcpy(char *, const char *);
char     *stpncpy(char *, const char *, size_t);
char     *strcat(char *, const char *);

#endif /* AMD64STRING_H */
