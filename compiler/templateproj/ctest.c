#include <math.h>
#include <stdio.h>

typedef struct {
	int x;
	int y;
} point;

int incr(int x) {
	return x + 1;
}

double cplxmod(double a, double b) {
	return sqrt((a*a) + (b*b));
}

void printpt(point p) {
	printf("x = %d, y = %d\n", p.x, p.y);
}

void incrpt(point *p) {
	p->x = p->x + 1;
	p->y = p->y + 1;
}
