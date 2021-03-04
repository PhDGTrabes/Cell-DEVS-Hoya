/**
 * Copyright (c) 2020, Román Cárdenas Rodríguez
 * ARSLab - Carleton University
 * GreenLSI - Polytechnic University of Madrid
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 1. Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

#include <fstream>
#include <chrono>
#include <iostream>
#include <cadmium/modeling/dynamic_coupled.hpp>
#include <cadmium/engine/pdevs_dynamic_runner.hpp>
#include <cadmium/logger/common_loggers.hpp>
#include <model/hoya_coupled.hpp>
#include "DESTimes/include/NDTime.hpp"



using namespace std;
using namespace cadmium;
using namespace cadmium::celldevs;
using std::cout;
using std::endl;
using hclock=std::chrono::high_resolution_clock;
using TIME = NDTime;

/*************** Loggers *******************/
static ofstream out_messages("logs/pandemic_hoya_outputs.txt");
struct oss_sink_messages{
    static ostream& sink(){
        return out_messages;
    }
};
static ofstream out_state("logs/pandemic_hoya_state.txt");
struct oss_sink_state{
    static ostream& sink(){
        return out_state;
    }
};

using state=logger::logger<logger::logger_state, dynamic::logger::formatter<TIME>, oss_sink_state>;
using log_messages=logger::logger<logger::logger_messages, dynamic::logger::formatter<TIME>, oss_sink_messages>;
using global_time_mes=logger::logger<logger::logger_global_time, dynamic::logger::formatter<TIME>, oss_sink_messages>;
using global_time_sta=logger::logger<logger::logger_global_time, dynamic::logger::formatter<TIME>, oss_sink_state>;

using logger_top=logger::multilogger<state, log_messages, global_time_mes, global_time_sta>;


int main(int argc, char ** argv) {

	//auto time_init, time_end;
	int threads;

    if (argc < 2) {
        cout << "Program used with wrong parameters. The program must be invoked as follows:";
        cout << argv[0] << " SCENARIO_CONFIG.json [MAX_SIMULATION_TIME (default: 500)]" << endl;
        return -1;
    }

	#if defined CPU_PARALLEL || defined CPU_LAMBDA_PARALLEL || defined CPU_DELTA_PARALLEL
    	if (argc = 3) {
    		threads = std::atoi(argv[3]);

    	//std::cout << "threads:" << threads << endl;
		}
    #endif //CADMIUM_EXECUTE_CONCURRENT

    //std::cout << "Creating model" << endl;

    auto time_init = hclock::now();

    hoya_coupled<TIME> test = hoya_coupled<TIME>("pandemic_hoya");
    std::string scenario_config_file_path = argv[1];
    test.add_lattice_json(scenario_config_file_path);

    test.couple_cells();
    std::shared_ptr<cadmium::dynamic::modeling::coupled<TIME>> t = std::make_shared<hoya_coupled<TIME>>(test);

    auto time_end = hclock::now();

    //std::cout << std::chrono::duration_cast<std::chrono::duration<double, std::ratio<1>>>(time_end - time_init).count() << std::endl;

    //std::cout << "Creating engine" << endl;

    time_init = hclock::now();

	#if defined CPU_PARALLEL || defined CPU_LAMBDA_PARALLEL || defined CPU_DELTA_PARALLEL
    	//if(argc = 3){
    		cadmium::dynamic::engine::runner<TIME, logger_top> r(t, {0}, threads);
    	//}else{
    		//cadmium::dynamic::engine::runner<TIME, logger_top> r(t, {0});
    	//}
    #else
    	cadmium::dynamic::engine::runner<TIME, logger_top> r(t, {0});
    #endif //CADMIUM_EXECUTE_CONCURRENT

    time_end = hclock::now();

    //float sim_time = (argc > 2)? atof(argv[2]) : 500;

    //std::cout << std::chrono::duration_cast<std::chrono::duration<double, std::ratio<1>>>(time_end - time_init).count() << std::endl;

	//#if defined CPU_PARALLEL || defined CPU_LAMBDA_PARALLEL || defined CPU_DELTA_PARALLEL
    //	int sim_time_seconds = (argc > 3)? atof(argv[3]) : 500;
    //#else
    	//int sim_time_seconds = (argc > 2)? atof(argv[2]) : 500;
    //#endif //CADMIUM_EXECUTE_CONCURRENT
    int sim_time_seconds = atof(argv[2]);

    //convert seconds to hours, minutes and seconds
    	int hours = sim_time_seconds/3600;
    	int remainder = sim_time_seconds-(hours*3600);
    	int minutes = remainder/60;
    	int seconds = remainder-(minutes*60);

    // set simulation time in NDTime //
    	NDTime sim_time({hours,minutes,seconds,0,0,0,0,0});

    //std::cout << "Executing simulation" << endl;

    time_init = hclock::now();

    r.run_until(sim_time);

    time_end = hclock::now();

    std::cout << std::chrono::duration_cast<std::chrono::duration<double, std::ratio<1>>>(time_end - time_init).count() << std::endl;

    return 0;
}
