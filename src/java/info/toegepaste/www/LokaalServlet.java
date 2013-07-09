/*
    This file is part of javaProject2TI.

    javaProject2TI is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    javaProject2TI is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with javaProject2TI.  If not, see <http://www.gnu.org/licenses/>.
*/
package info.toegepaste.www;

import info.toegepaste.www.entity.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author robin
 */
@WebServlet(name = "LokaalServlet", urlPatterns = {"/LokaalServlet"})
public class LokaalServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        EntityManagerFactory emf = null;
        HttpSession session = request.getSession();
        try {

            RequestDispatcher rd = null;
            emf = Persistence.createEntityManagerFactory("2TI3_Cominotto_Robin_project2013PU");
            EntityManager em = emf.createEntityManager();

            if(session.getAttribute("ingelogd")!=null){
            if (!(request.getParameter("lokalen") == null)) {


                Query q = em.createNamedQuery("Lokaal.alle");
                List<Lokaal> lokalen = q.getResultList();

                em.close();
                request.setAttribute("lokalen", lokalen);

                rd = request.getRequestDispatcher("overzichtLokalen.jsp");
                rd.forward(request, response);

            } else if (!(request.getParameter("toevoegenLokaal") == null)) {
                String[] lokalen = new String[]{"GewoonLokaal", "ComputerLokaal"};
                Lokaal lokaal = new Lokaal();
                request.setAttribute("lokaal", lokaal);
                em.close();
                request.setAttribute("lokaalTypes", lokalen);

                rd = request.getRequestDispatcher("toevoegenLokaal.jsp");
                rd.forward(request, response);

            } else if (!(request.getParameter("toevoegenLokaalBevestigen") == null)) {
                String nummer = request.getParameter("nummer");
                String aantalPlaatsen = request.getParameter("aantalPlaatsen");
                String lokaalType = request.getParameter("soortLokaal");
                String lokaalId = request.getParameter("lokaalId");
                String laptop = request.getParameter("laptop");
                String info = request.getParameter("info");
                String whiteboard = request.getParameter("whiteboard");

                Lokaal lokaal;

                if (lokaalType.equals("GewoonLokaal")) {
                    GewoonLokaal lokaalGewoon = new GewoonLokaal();

                    lokaalGewoon.setWhiteBoard(Boolean.parseBoolean(whiteboard));
                    lokaal = lokaalGewoon;
                } else {
                    ComputerLokaal lokaalComputer = new ComputerLokaal();
                    lokaalComputer.setInfo(info);
                    lokaalComputer.setLaptop(Boolean.parseBoolean(laptop));
                    lokaal = lokaalComputer;
                }

                if (!lokaalId.isEmpty() && !(lokaalId == null)) {
                    lokaal.setId(Long.parseLong(lokaalId));
                }


                lokaal.setAantalPlaatsen(Integer.parseInt(aantalPlaatsen));
                lokaal.setNummer(nummer);

                EntityTransaction tx = em.getTransaction();

                tx.begin();
                if (!lokaalId.isEmpty() && !(lokaalId == null)) {
                    out.println(lokaal.getId());
                    out.println("merge");
                    
                    em.merge(lokaal);
                 
            
                   
                } else {
                    out.println("persist");
                    em.persist(lokaal);
                }




                tx.commit();
                Query q = em.createNamedQuery("Lokaal.alle");
                List<Lokaal> lokalen = q.getResultList();
                session.setAttribute("lokalen", lokalen);
                em.close();
                rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            } else if (!(request.getParameter("deleteLokaal") == null)) {
                String lokaalId = request.getParameter("deleteLokaal");
                Lokaal lokaal = em.find(Lokaal.class, Long.parseLong(lokaalId));


                EntityTransaction tx = em.getTransaction();

                tx.begin();
                try {
                    em.remove(lokaal);
                    tx.commit();
                } catch (Exception e) {
                    Query q = em.createNamedQuery("Lokaal.alle");
                    List<Lokaal> lokalen = q.getResultList();
                    request.setAttribute("lokalen", lokalen);
                    em.close();
                    String boodschap = "Dit lokaal kan niet verwijderd worden!";
                    request.setAttribute("boodschap", boodschap);
                    rd = request.getRequestDispatcher("boodschap.jsp");
                    rd.forward(request, response);
                }

                Query q = em.createNamedQuery("Lokaal.alle");
                List<Lokaal> lokalen = q.getResultList();

                session.setAttribute("lokalen", lokalen);

                em.close();

                rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            } else if (!(request.getParameter("wijzigenLokaal") == null)) {
                String[] lokalen = new String[]{"GewoonLokaal", "ComputerLokaal"};
                request.setAttribute("lokaalTypes", lokalen);

                String lokaalId = request.getParameter("wijzigenLokaal");
                Lokaal lokaal = em.find(Lokaal.class, Long.parseLong(lokaalId));



                em.close();

                request.setAttribute("lokaal", lokaal);
                rd = request.getRequestDispatcher("toevoegenLokaal.jsp");
                rd.forward(request, response);
            }
            }
            else{
               response.sendRedirect("index.jsp");
           }





            //let op: gebruik hier de juiste naam van de persistence unit
            //(zoek op in persistence.xml)

            /*
             emf = Persistence.createEntityManagerFactory("2TI3_Cominotto_Robin_project2013PU");

             EntityManager em = emf.createEntityManager();



             EntityTransaction tx = em.getTransaction();
             Docent docentEen = new Docent();
             Docent docentTwee = new Docent();

             Examen examenEen = new Examen();
             Examen examenTwee = new Examen();
             Examen examenDrie = new Examen();

             ComputerLokaal computerLokaal = new ComputerLokaal();
             GewoonLokaal gewoonLokaal = new GewoonLokaal();
             Vak vakEen = new Vak();
             Vak vakTwee = new Vak();
             Vak vakDrie = new Vak();
             tx.begin();

             computerLokaal.setAantalPlaatsen(100);
             computerLokaal.setNummer("D101");
             computerLokaal.setLaptop(false);
             computerLokaal.setInfo("Niet roken!");
             em.persist(computerLokaal);


             vakEen.setNummer("s5454");
             vakEen.setNaam("C#");
             em.persist(vakEen);


             docentEen.setNummer("r00001");
             docentEen.setVoornaam("Miranda");
             docentEen.setFamilienaam("Decabooter");
             docentEen.setEmail("Miranda.Decabooter@khk.be");
             em.persist(docentEen);



             examenEen.setVak(vakEen);
             examenEen.setDocent(docentEen);
             examenEen.setDatum(new GregorianCalendar());
             examenEen.setLokaal(computerLokaal);
             examenEen.setSoort(Soort.SCHRIFTELIJK);
             em.persist(examenEen);




             //Insert 2
             gewoonLokaal.setAantalPlaatsen(50);
             gewoonLokaal.setNummer("Noord-Korea");
             gewoonLokaal.setWhiteBoard(true);
             em.persist(gewoonLokaal);

             vakTwee.setNummer("s5455");
             vakTwee.setNaam("Dynamische webapplicaties in PHP");
             em.persist(vakTwee);



             examenTwee.setVak(vakTwee);
             examenTwee.setDocent(docentEen);
             examenTwee.setDatum(new GregorianCalendar());
             examenTwee.setLokaal(gewoonLokaal);
             examenTwee.setSoort(Soort.SCHRIFTELIJK);
             em.persist(examenTwee);

             //Insert 3


             vakDrie.setNummer("s5456");
             vakDrie.setNaam("UML");
             em.persist(vakDrie);

             docentTwee.setNummer("r00002");
             docentTwee.setVoornaam("Christine");
             docentTwee.setFamilienaam("Smeets");
             docentTwee.setEmail("Christine.Smeets@khk.be");
             em.persist(docentTwee);

             examenDrie.setVak(vakDrie);
             examenDrie.setDocent(docentTwee);
             examenDrie.setDatum(new GregorianCalendar());
             examenDrie.setLokaal(gewoonLokaal);
             examenDrie.setSoort(Soort.SCHRIFTELIJK);
             em.persist(examenDrie);
             tx.commit();

             em.close();




             */

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            emf.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
