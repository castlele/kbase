**UUID** is a 128 bit number, that usually used as a unique identifier. Its text representation is a series of 32 hexadecimal symbols separated by hyphens (`-`) on five groups like "8-4-4-4-12" (For example: `3422b448-2460-4fd2-9183-8000de6f8343`).

M and N places determines what version and variation of UUID:
```
xxxxxxxx-xxxx-Mxxx-Nxxx-xxxxxxxxxxxx
```

Version is determined on M position as 4 most significant bits (4 старшими битами):
![[uuid_version.png]]

On the other hand, variation is determined on N position as 1-3 most significant bits (1-3 старшими битами):
![[uuid_variation.png]]