config = Debug
v = 4.5

all:
	MONO_IOMAP=case xbuild *.*proj /t:Build /p:Configuration=$(config) /p:TargetFrameworkVersion=v$(v)

clean:
	MONO_IOMAP=case xbuild *.*proj /t:Clean

.PHONY: all clean
