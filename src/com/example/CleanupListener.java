// package com.example;

// import javax.servlet.ServletContextEvent;
// import javax.servlet.ServletContextListener;
// import javax.servlet.annotation.WebListener;
// import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;

// @WebListener
// public class CleanupListener implements ServletContextListener {
//     @Override
//     public void contextDestroyed(ServletContextEvent sce) {
//         try {
//             AbandonedConnectionCleanupThread.checkedShutdown();
//             System.out.println("MySQL Cleanup thread shut down.");
//         } catch (Exception e) {
//             e.printStackTrace();
//         }
//     }

//     @Override
//     public void contextInitialized(ServletContextEvent sce) {
//         // No action needed
//     }
// }
