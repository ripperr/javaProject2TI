/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
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
@WebServlet(name = "VakServlet", urlPatterns = {"/VakServlet"})
public class VakServlet extends HttpServlet {

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
            if (!(request.getParameter("vakken") == null)) {


                Query q = em.createNamedQuery("Vakken.alle");
                List<Docent> docenten = q.getResultList();

                em.close();
                request.setAttribute("vakken", docenten);

                rd = request.getRequestDispatcher("overzichtVakken.jsp");
                rd.forward(request, response);

            } else if (!(request.getParameter("vakToevoegen") == null)) {
                rd = request.getRequestDispatcher("toevoegenVak.jsp");
                rd.forward(request, response);
            } else if (!(request.getParameter("vakToevoegenBevestigen") == null)) {
                String nummer = request.getParameter("nummerVak");
                String naam = request.getParameter("naamVak");
                String vakId = request.getParameter("vakId");

                Vak vak = new Vak();
                vak.setNummer(nummer);
                vak.setNaam(naam);
                EntityTransaction tx = em.getTransaction();
                tx.begin();
                if (!vakId.isEmpty() && !(vakId == null)) {
                    vak.setId(Long.parseLong(vakId));
                    em.merge(vak);
                } else {
                    em.persist(vak);
                }



                tx.commit();



                Query q = em.createNamedQuery("Vakken.alle");
                List<Vak> vakken = q.getResultList();
                session.setAttribute("vakken", vakken);
                em.close();

                rd = request.getRequestDispatcher("overzichtVakken.jsp");
                rd.forward(request, response);
            } else if (!(request.getParameter("wijzigenVak") == null)) {


                String vakId = request.getParameter("wijzigenVak");
                Vak vak = em.find(Vak.class, Long.parseLong(vakId));



                em.close();

                request.setAttribute("vak", vak);
                rd = request.getRequestDispatcher("toevoegenVak.jsp");
                rd.forward(request, response);
            } else if (!(request.getParameter("deleteVak") == null)) {
                String vakId = request.getParameter("deleteVak");
                Vak vak = em.find(Vak.class, Long.parseLong(vakId));


                EntityTransaction tx = em.getTransaction();

                tx.begin();
                try {
                    em.remove(vak);
                    tx.commit();
                } catch (Exception e) {
                    Query q = em.createNamedQuery("Vakken.alle");
                    List<Vak> vakken = q.getResultList();
                    request.setAttribute("vakken", vakken);
                    em.close();
                    String boodschap = "Dit vak kan niet verwijderd worden!";
                    request.setAttribute("boodschap", boodschap);
                    rd = request.getRequestDispatcher("boodschap.jsp");
                    rd.forward(request, response);
                }

                Query q = em.createNamedQuery("Vakken.alle");
                List<Vak> vakken = q.getResultList();

                session.setAttribute("vakken", vakken);

                em.close();

                rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }
            } else{
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
