#ifndef BLOCK_H
#define BLOCK_H

#include "Point.h"
#include <vector>
#include <set>
#include <string>
using namespace std;

class Block
{
public:
	int id;												// ID of the block									// ID of the zone (from JSON input)
	int nbInhabitants ;									// Number of inhabitants
	vector <Point> verticesPoints;						// Copy of the points that delimit the block
	double minX = 1.e30;								// Minimum X coordinate of the vertices of the block
	double maxX = -1.e30;								// Maximum X coordinate of the vertices of the block
	double minY = 1.e30;								// Minimum Y coordinate of the vertices of the block
	double maxY = -1.e30;								// Maximum Y coordinate of the vertices of the block
	set <int> adjacentBlockss;							// Adjacent blocks
	// Distance of a point to the closest point in the block
	double distance(const Point & p1);
	vector<vector<Point>> testScenarios;				// Scenarios for training

};

#endif
