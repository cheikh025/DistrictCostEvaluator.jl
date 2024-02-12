#ifndef DISTRICT_H
#define DISTRICT_H

#include <vector>
#include <set>
#include "Point.h"
using namespace std;

class District
{

public:
	
	set < int > blocks;											// Blockss composing the district
	vector < double > evaluationCosts;							// TSP cost evaluations
	vector < double > onlyDepotCosts;							
	vector < double > notDepotCosts;							

	vector < int > evaluationNbCustomers;						// Number of customers sampled in each TSP cost evaluation
	double averageCost=0.;											// Average TSP cost over all Scenarios
  
	// Constructor
	District(set < int > & blocks) : blocks(blocks)
	{};			
};

// JSON output
void to_json(json& j, const District& p);

#endif
