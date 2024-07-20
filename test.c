#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>

extern size_t strlen(const char *);
extern char *strchr(const char *, int);
extern char *strrchr(const char *, int);
extern void *memset(void *, int, size_t);
extern void *memcpy(void *, const void *, size_t);
extern int strcmp(const char *, const char *);
extern int strncmp(const char *, const char *, size_t);

int main() {
    const char *str = "Hello, World!";
    // strlen.asm
    size_t length = strlen(str);
    size_t length2 = strlen("");

    // strchr.asm
    char *chr = strchr(str, 111);
    char *chr2 = strchr("", 111);

    // strrchr.asm
    char *rchr = strrchr(str, 111);
    char *rchr2 = strrchr("", 111);

    // memset.asm
    char *memset_str = malloc(100);
    memset(memset_str, 66, 5);
    char *memset_str2 = malloc(100);
    memset(memset_str2, 66, 0);

    // memcpy.asm
    char *memcpy_str1 = malloc (100);
    char *memcpy_str2 = malloc (100);
    strcpy (memcpy_str2, "Wapeq est boost");
    char *memcpy_str01 = malloc (100);
    char *memcpy_str02 = malloc (100);
    strcpy (memcpy_str02, "Wapeq est boost");
    memcpy(memcpy_str1, memcpy_str2, 8);
    memcpy(memcpy_str01, memcpy_str02, 0);

    // strcmp.asm
    char *str_cmp1 = malloc (100);
    strcpy (str_cmp1, "Hellozz");
    char *str_cmp2 = malloc (100);
    strcpy (str_cmp2, "Hello");
    int temp = strcmp(str_cmp1, str_cmp2);
    strcpy (str_cmp2, "Hellozz");
    int temp2 = strcmp(str_cmp1, str_cmp2);
    strcpy (str_cmp2, "Hellozzzz");
    int temp3 = strcmp(str_cmp1, str_cmp2);

    // strncmp.asm
    char *str_ncmp1 = malloc (100);
    strcpy (str_ncmp1, "Hellozz");
    char *str_ncmp2 = malloc (100);
    strcpy (str_ncmp2, "Hello");
    int ntemp = strncmp(str_ncmp1, str_ncmp2, 8);
    strcpy (str_ncmp2, "Hellozz");
    int ntemp2 = strncmp(str_ncmp1, str_ncmp2, 8);
    strcpy (str_ncmp2, "Hellozzzz");
    int ntemp3 = strncmp(str_ncmp1, str_ncmp2, 8);

    // Affichage
    printf("\nLength  :  (Hello World!) --> '%d'  /  (empty) --> '%d'\n", length, length2);
    printf("Strchr  :  (Hello world!) --> '%p'  /  (empty) --> '%p'\n", chr, chr2);
    printf("Strrchr :  (Hello world!) --> '%p'  / (empty) --> '%p'\n", rchr, rchr2);
    printf("Memset  :  (5) --> '%s'  /  (0) --> '%s' \n", memset_str, memset_str2);
    printf("Memcpy  :  (8) --> '%s'  /  (0) --> '%s' \n", memcpy_str1, memcpy_str01);
    printf("Strcmp  :  (str1>str2) --> '%d'  /  (equal) --> '%d'  /  (str1<str2) --> '%d'\n", temp, temp2, temp3);
    printf("Strncmp :  (str1>str2) --> '%d'  /  (equal) --> '%d'  /  (str1<str2) --> '%d'\n\n", ntemp, ntemp2, ntemp3);

    return 0;
}