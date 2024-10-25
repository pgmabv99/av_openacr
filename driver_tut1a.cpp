//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.
//
// Target: samp_tut1a (exe)
// Exceptions: yes
// Source: cpp/samp_tut1a.cpp
//

#include "include/algo.h"
#include "include/samp_tut1a.h"

samp_tut1a::Partproj *samp_tut1a::CreatePartProj(samp_tut1a::Part &part, samp_tut1a::Proj &proj) {
    Partproj *pp = &partproj_Alloc();
    pp->p_part = &part;
    pp->p_proj = &proj;
    if (!partproj_XrefMaybe(*pp)) {
        partproj_Delete(*pp);
        pp=NULL;
    }
    return pp;
}

static void Show() {
    prlog("list of projects and their parts");
    ind_beg(samp_tut1a::_db_zd_proj_curs,proj,samp_tut1a::_db) {
        prlog("  project "<<proj.proj);
        ind_beg(samp_tut1a::proj_zd_partproj_curs,partproj,proj) {
            prlog("    has part "<<partproj.p_part->part);
            prlog("    has myi32 "<<partproj.p_part->myi32);
        }ind_end
    }ind_end;
    // prlog("list of parts and their projects");
    // ind_beg(samp_tut1a::_db_zd_part_curs,part,samp_tut1a::_db) {
    //     prlog("  part "<<part.part);
    //     if (samp_tut1a::Partproj *partproj = part.c_partproj) {
    //         prlog("    has project "<<partproj->p_proj->proj);
    //         prlog(Keyval("    has part ", partproj->p_part->part));
    //     }
    // }ind_end;
    prlog("");
}

void samp_tut1a::Main() {
    samp_tut1a::Proj &proj1 = samp_tut1a::ind_proj_GetOrCreate("proj1");
    samp_tut1a::Proj &proj2 = samp_tut1a::ind_proj_GetOrCreate("proj2");

    samp_tut1a::Part &part1 = samp_tut1a::ind_part_GetOrCreate("part1");
    samp_tut1a::Part &part2 = samp_tut1a::ind_part_GetOrCreate("part2");
    samp_tut1a::Part &part3 = samp_tut1a::ind_part_GetOrCreate("part3");

    // assign parts to projects
    samp_tut1a::CreatePartProj(part1,proj1);
    samp_tut1a::CreatePartProj(part2,proj1);
    samp_tut1a::CreatePartProj(part3,proj2);

    // list parts
    prlog("initial setup for AV               !!!!!!");
    Show();

    // delete a part -- this will remove it from any projects
    // that reference the part
    prlog("deleting part1");
    part_Delete(part1);
    Show();
    // let's not reference part1 beyond this point

    // delete a project
    prlog("deleting proj2");
    proj_Delete(proj2);
    // now part3 will become unassigned
    Show();

    prlog("deleting proj1");
    proj_Delete(proj1);
    // at this point, part2 and part3 remain,
    // but they aren't attached to any project
    Show();

    prlog("av done8")
}
