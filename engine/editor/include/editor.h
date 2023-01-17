#pragma once

namespace Laplace {

    /**
     * Class definition of LaplaceEditor.
     */
    class LaplaceEditor {
    public:
        LaplaceEditor();
        virtual ~LaplaceEditor();

        /** Initialize LaplaceEditor. */
        void initialize();

        /** Start LaplaceEditor. */
        void start();
    };
}